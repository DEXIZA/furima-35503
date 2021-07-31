class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_time

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
    validates :user_id
  end

  validates :category, numericality: { other_than: 1 } 
  validates :condition, numericality: { other_than: 1 } 
  validates :shipping_charge, numericality: { other_than: 1 } 
  validates :prefecture, numericality: { other_than: 1 } 
  validates :shipping_time, numericality: { other_than: 1 } 

end
