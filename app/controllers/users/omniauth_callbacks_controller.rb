class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook          #facebook認証を実行時に発動
    callback_for(:facebook)
  end

  def google_oauth2     #google認証を実行時に発動
    callback_for(:google)
  end

  def callback_for(provider)
    sns = SnsCredential.from_omniauth(request.env["omniauth.auth"]) #既にSNSでの登録実績がある場合、Sns_credentialsテーブルから該当レコードを探す。メソッドの内容はSnsCredentialモデル内に記述
    if sns[0]                                                       #該当レコードがある場合、ログイン。
      sign_in User.find(sns[0].user_id) unless user_signed_in?
      redirect_to root_path
    else
      session["devise_data"] = request.env["omniauth.auth"].except("extra") #該当レコードがない場合、SNS情報を流用して新規登録させる。request.env["omniauth.auth"]は、SNSのユーザー情報。
      redirect_to signup1_signup_index_path
    end
  end
end