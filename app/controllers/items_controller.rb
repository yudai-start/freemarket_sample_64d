class ItemsController < ApplicationController
  def index

    @items = Item.all.includes(:images)
  end

  def new
    @item = Item.new
    @item.images.build
  end
  
  def edit
  end

  def create
    @item = Item.new(item_params)
    @item[:status] = 1
    if @item.save
      redirect_to root_path 
    else
      @item.images.build
      render :new
      
    end
    
  end

  private
  def item_params
    params.require(:item).permit(:name,
                                 :size,
                                 :item_status_id,
                                 :shipping_fee_defrayer_id,
                                 :shipping_system,
                                 :item_status,
                                 :shipping_fee_defrayer,
                                 :ship_from_prefecture,
                                 :ship_date_id, 
                                 :price,
                                 :description,
                                 :buyer_id,
                                 :status,
                                 images_attributes:[:id, :image, :item_id]).merge(user_id: current_user.id, size:"", shipping_system:"")        

  end
end