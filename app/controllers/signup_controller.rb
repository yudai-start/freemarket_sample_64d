class SignupController < ApplicationController

  require "payjp" #gemを読み込み。カード情報登録に必要

  def signup1
    @user = User.new
  end

  def signup2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = date_params[:year]+date_params[:month]+date_params[:day]
    @user = User.new
  end

  def signup3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.addresses.build
  end

  def signup4
    @user = User.new
    session[:addresses_attributes] = user_params[:addresses_attributes]
  end

  def create
    @user = User.new(
      nickname:         session[:nickname],
      email:            session[:email],
      password:         session[:password],
      password_confirmation: session[:password],
      family_name:      session[:family_name],
      first_name:       session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana:  session[:first_name_kana],
      phone_number:     session[:phone_number],
      birthday:         session[:birthday],
    )
    @user.addresses.build(session[:addresses_attributes].first[1])

    if @user.save!
      session[:id] = @user.id
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] #APIキーを使ってPayjpクラスを初期化
      Payjp.api_key = 'sk_test_8f7b3eac5d76594d259acfc9'
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      @card = Card.create!(
        user_id: @user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      redirect_to signup5_signup_index_path
    else
      render '/signup/signup1'
    end
  end

  def signup5
    sign_in User.find(session[:id]) unless user_signed_in?
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
