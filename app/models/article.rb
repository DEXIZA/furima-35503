class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_time

  validates :category, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charge, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_time, numericality: { other_than: 1 , message: "can't be blank"} 

end