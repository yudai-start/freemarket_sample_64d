class ItemsController < ApplicationController

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
end
