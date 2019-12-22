class UsersController < ApplicationController

  def edit_address
  end

  def edit
    @user = current_user
    # binding.pry
  end

  def update
    user = User.find(current_user.id)
    # binding.pry¥
    if user.update!(update_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def show
    user = User.find(params[:id])
    @items = user.items

  end

  private

  def update_params
    params.require(:user).permit(:nickname, :introduction)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end