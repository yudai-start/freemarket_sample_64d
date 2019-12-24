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

  def exhibiting 
    @items = current_user.items.includes(:images)
    @exhibitingitems = @items.where(buyer_id: nil)
    @solditems = @items.where.not(buyer_id: nil)
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