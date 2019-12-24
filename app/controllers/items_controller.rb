class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy_confirm, :done_buy_confirm]
  before_action :move_to_show, only: [:buy_confirm, :done_buy_confirm]
  before_action :owner_check, only: [:edit, :update, :destroy]

  require "payjp"

  def index
    @items = Item.where.not(status:"2").includes(:images)
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.build
  end
  
  def edit
  end


  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to action: 'show' 
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
    if Card.find_by(user_id: current_user.id) #カードの登録がある場合のみ閲覧可
      card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id) #payjpからログイン中のユーザーのカード情報取得
      @card = customer.cards.retrieve(card.card_id) 
    else
      redirect_to new_card_path #カード登録がない場合、カード登録画面へリダイレクト
    end
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

  def move_to_show
    redirect_to action: :show if (@item.user_id == current_user.id) || (@item.status != 1)
  end

  def owner_check
    redirect_to action: :index if (@item.user_id != current_user.id)
  end
end