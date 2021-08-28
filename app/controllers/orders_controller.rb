class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  # ログイン・ログアウトで判定
  
  def index
    redirect_to "/" if @item.order.present?
    @order_address = OrderAddress.new
  end

  def create
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
    def set_item
      @item = Item.find(params[:item_id])
    end
end
