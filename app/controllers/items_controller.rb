class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)

  end

  private

  def item_params
    params.require(:item).permit(:name, :size, :item_status, :shipping_fee_defrayer,
                                        :shipping_system, :ship_from_prefecture, :ship_date, 
                                        :price,:description, :buyer_id, :status ).merge(user_id: 1)        
  end
end


     