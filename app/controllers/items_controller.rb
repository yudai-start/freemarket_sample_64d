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
    # item_params[:images_attributes] = item_params[:images_attributes].to_hash.first[1]["image"]

    @item = Item.new(item_params
      # name:                  item_params[:name],
      # user_id:                item_params[:use_id],
      # size:                   item_params[:size],
      # item_status:            item_params[:item_status],
      # shipping_fee_defrayer:  item_params[:shipping_fee_defrayer],
      # shipping_system:        item_params[:shipping_system],
      # # ship_from_prefecturer:  item_params[:ship_from_prefecture],
      # ship_date:              item_params[:ship_date],
      # price:                  item_params[:price],
      # description:            item_params[:description],
      # buyer_id:              item_params[:buyer_id]
      # # status:                item_params[:status]
    )
  
    @item[:status] = 1

    # @item.images.build(item_params[:images_attributes].to_hash.first[1])

    # @item.images.build(item_params[:images_attributes].first[1])


    if @item.save!

      redirect_to root_path

    end
    
    

  end

  private

  def item_params
    params.require(:item).permit(:name,
                                #  :user_id,
                                #  :size,
                                 :item_status,
                                 :shipping_fee_defrayer,
                                #  :shipping_system,
                                 :ship_from_prefecture,
                                 :ship_date, 
                                 :price,
                                 :description,
                                 :buyer_id,
                                 :status,
                                 images_attributes:[:id, :image, :item_id]).merge(user_id: 1, size:"", shipping_system:"")        

  end
end