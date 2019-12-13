class ItemsController < ApplicationController

  def index
    # binding.pry
    @items = Item.all
  end

end
