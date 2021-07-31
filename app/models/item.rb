class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
    validates :user_id
  end
end
