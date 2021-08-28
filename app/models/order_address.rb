class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :item_id, :user_id,:token

  validates :token, presence: true

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :street_address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end