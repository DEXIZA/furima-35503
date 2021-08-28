class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  # ログイン・ログアウトで判定、除外ページ以外はトップへの処理

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private
    def order_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :home_num, :street_address, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
    end
end
