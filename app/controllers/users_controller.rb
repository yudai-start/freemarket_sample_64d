class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    user = User.find(current_user.id)
    if user.update!(update_params)
      redirect_to "/users/mypage"
    else
      render :edit
    end
  end

  def mypage
  end

  def signout
  end

  private

  def update_params
    params.require(:user).permit(:nickname, :introduction)
  end
end