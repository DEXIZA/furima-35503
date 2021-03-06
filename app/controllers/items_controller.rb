class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # ログイン・ログアウトで判定、除外ページ以外はトップへの処理
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
    # 更新成功→詳細画面偏移　更新失敗→編集画面偏移の処理
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :description,
      :price,
      :category_id,
      :condition_id,
      :shippingcharge_id,
      :prefecture_id,
      :shippingtime_id,
      :image
    )
          .merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id && @item.order.blank?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
