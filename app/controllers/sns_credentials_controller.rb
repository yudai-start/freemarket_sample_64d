class SnsCredentialsController < ApplicationController
  # def index
  #   @sns_credentials = current_user.sns_credentials if current_user
  # end

  # def create
  #   auth = request.env["omniauth.auth"]
  #   current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
  #   flash[:notice] = "Authentication successful."
  #   redirect_to root_path
  # end

  # def destroy
  #   @authentication = current_user.authentications.find(params[:id])
  #   @authentication.destroy
  #   flash[:notice] = "Successfully destroyed authentication."
  #   redirect_to authentications_url
  # end

end
