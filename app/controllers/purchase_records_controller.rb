class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record= PurchaseRecord.new
  end

  def create
    @donation = Donation.create(donation_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def donation_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  end
end
