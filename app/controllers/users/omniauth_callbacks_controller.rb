class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    sns = SnsCredential.from_omniauth(request.env["omniauth.auth"])
    if sns
      sign_in User.find(sns[0].user_id) unless user_signed_in?
      redirect_to root_path
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to signup1_signup_index_path
    end
  end
end
