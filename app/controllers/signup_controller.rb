class SignupController < ApplicationController

  require "payjp" #gemを読み込む。カード情報登録に必要

  def signup1
    if session["devise_data"]             #SNS経由の新規登録の際、SNS上の名前とメールをビューに渡し、入力フォームの初期値とする。
      @name  = session["devise_data"]["info"]["name"]
      @email = session["devise_data"]["info"]["email"]
    else
      @name = ""
      @email = ""
    end
    @user = User.new
    @maillist = User.pluck(:email)
  end

  def signup2
    @user = User.new
    @phonelist = User.pluck(:phone_number)
    session[:nickname]         = user_params[:nickname]    #sessionに一時データを格納することでpage遷移が可能
    session[:email]            = user_params[:email]
    session[:password]         = user_params[:password]
    session[:family_name]      = user_params[:family_name]
    session[:first_name]       = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana]  = user_params[:first_name_kana]
    session[:birthday]         = date_params[:year]+date_params[:month]+date_params[:day]   #年、月、日を結合
  end

  def signup3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.addresses.build    #この記述により、addressesテーブル用のfields_forフォームが、signup3に表示可能
  end

  def signup4
    @user = User.new
    session[:addresses_attributes] = user_params[:addresses_attributes] #住所テーブルのパラメータを一時保存
  end

  def create
    @user = User.new(
      nickname:         session[:nickname],
      email:            session[:email],
      password:         session[:password],
      family_name:      session[:family_name],
      first_name:       session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana:  session[:first_name_kana],
      phone_number:     session[:phone_number],
      birthday:         session[:birthday],
    )
    @user.addresses.build(session[:addresses_attributes].first[1]) #addressesインスタンスを生成。usersインスタンスがsaveされると同時にsaveされる。
                                                                   #sessionのままだと何故かハッシュではなかったので、.first[1]でハッシュに変えています。
    if @user.save!
      session[:id] = @user.id
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]#APIキーを使ってPayjpクラスを初期化 (本番環境用)
      customer = Payjp::Customer.create()#pay.jsサイトで顧客IDを生成、取得。
      card = customer.cards.create( #カードトークンをpay.jsサイトに登録し、カードidをpay.jsサイトから取得。
        card: params[:payjpToken]
      )
      Card.create!(   #顧客id, カードidと、userとを結びつける、cardsインスタンスを保存する。
        user_id:     @user.id,    
        customer_id: customer.id,   #payjpの顧客id
        card_id:     card.id #payjpのカードid 
      )
      if session["devise_data"] #SNS経由の新規登録の際、各パラメータをSNS_credentialsテーブルに保存
        SnsCredential.create!(
          provider: session["devise_data"]["provider"],
          uid:      session["devise_data"]["uid"],
          user_id:  @user.id
        )
      end
      redirect_to signup5_signup_index_path   #インスタンスの保存ができれば、登録完了ページへ遷移
    else
      render '/signup/signup1'  #登録に失敗すれば、入力ページ1へ移動
    end
  end

  def signup5
    sign_in User.find(session[:id]) unless user_signed_in?  #登録完了と同時にログインさせる。※sign_inはdeviseのコマンド
  end

  private
  def user_params
    params.require(:user).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :nickname,
      :email,
      :password,
      :phone_number,
      :birthday_year,
      :birthday_month,
      :birthday_day,
      addresses_attributes: [
        :id,
        :family_name,
        :first_name,
        :family_name_kana,
        :first_name_kana,
        :post_code,
        :prefecture_id,
        :city,
        :street_number,
        :building_name,
        :phone_number
      ]
    )
  end

  def date_params
    params.require(:date).permit(
      :year,
      :month,
      :day
    )
  end
end