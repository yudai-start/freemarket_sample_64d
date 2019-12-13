class ItemsController < ApplicationController

  def destroy
    item = Item.find(params[:id])
  end
end
