class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @image = Image.new(image:image[])
    @item[:status] = 1
    if @item.save!
      redirect_to root_path

    end
    
    

  end

  private

  def item_params
    params.require(:item).permit(:name, :user_id, :size, :item_status, :shipping_fee_defrayer,
                                        :shipping_system, :ship_from_prefecture, :ship_date, 
                                        :price,:description, :buyer_id, :status ).merge(user_id: 1)        
  end
end


     