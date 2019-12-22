class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:buy_confirm]
  before_action :set_item, only: [:show, :update, :destroy, :buy_confirm, :done_buy_confirm]
  

  require "payjp"

  def index
    @items = Item.all.includes(:images)
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.build
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item.update(item.params)
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path 
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def buy_confirm
    card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id) #payjpからログイン中のユーザーのカード情報取得
      @card = customer.cards.retrieve(card.card_id) 
  end

  def done_buy_confirm
    card = Card.find_by(user_id: current_user.id) #payjpからログイン中のユーザーのカード情報取得し、支払いに利用
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_id,
        currency: 'jpy'
      )

    @item.update(status: 2, buyer_id: current_user.id) #itemのstatusを売却済に変更 購入者としてbuyer_idにcurrent_userのidを追加

    redirect_to "/"
  end

  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    
    @q=Item.ransack(params[:q]) #gem ransakを用いての詳細検索
    @items=@q.result
      # # ajaxで送られた場合にはjsonを変えす
      # unless params[:q].blank?
      #   render json: @users.select("id").map { |e| e.id  }.to_json
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
                                 images_attributes:[:id, :image, :item_id]).merge(user_id: current_user.id, size:"", shipping_system:"", status: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end