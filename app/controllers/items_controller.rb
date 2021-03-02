class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index] 

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
