class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def address_order_params
    params.require(:address_order).permit(:post_num, :prefecture_id, :municipality, :address, :building, :phone_num).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_order_params[:token],
      currency: 'jpy'
    )
  end
end
