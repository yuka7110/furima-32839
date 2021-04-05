class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end 
    @address_order = AddressOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new(address_order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_order_params
    params.require(:address_order).permit(:post_num, :prefecture_id, :municipality, :address, :building, :phone_num).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_506b5c52e40f4f60a178281a"
      Payjp::Charge.create(
        amount: @item.price,
        card: address_order_params[:token],
        currency: 'jpy'
      )
  end
  
end
