class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price, numericality: true, inclusion: { in: 300..9_999_999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_time_id
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_time
  belongs_to :condition
end
