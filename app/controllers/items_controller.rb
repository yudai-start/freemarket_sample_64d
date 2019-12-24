class ItemsController < ApplicationController
  def index

    @items = Item.all.includes(:images).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
  end
  
  def edit
    @item = Item.find(item_params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item.params)
  end

  def create
    @item = Item.new(item_params)
    @item[:status] = 1
    
    if item_params[:images_attributes]
      @item.save!
      redirect_to root_path 
      
    else
      @item.images.build
      render :new
    end
  end
    
  def exhibiting 
    items = Item.all.includes(:images)
    @items = items.where(user_id: current_user.id)
    @exhibitingitems = @items.where(status: "")
    # @tradingitems = @items.where(status: 2) 
    @solditems = @items.where(status: 1)
    
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