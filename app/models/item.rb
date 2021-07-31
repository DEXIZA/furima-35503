class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :item_name
    validates :description
    validates :price,numericality: true
    validates :user_id
    with_options presence: true, numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id 
      validates :shipping_charge_id 
      validates :prefecture_id 
      validates :shipping_time_id     
    end
  end
end
