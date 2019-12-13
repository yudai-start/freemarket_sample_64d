class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    sns = SnsCredential.from_omniauth(request.env["omniauth.auth"])
    if sns[0]
      sign_in User.find(sns[0].user_id) unless user_signed_in?
      redirect_to root_path
    else
      session["devise_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to signup1_signup_index_path
    end
  end
end