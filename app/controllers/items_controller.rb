class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :fee_id, :prefecture_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
