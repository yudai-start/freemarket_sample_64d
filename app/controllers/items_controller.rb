class ItemsController < ApplicationController

  def destroy
    item = Item.find(params[:id])
    redirect_to root_path
  end
end
