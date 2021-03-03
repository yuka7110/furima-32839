class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1 }
  validates :condition_id,  numericality: { other_than: 1 }
  validates :fee_id,        numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id,        numericality: { other_than: 1 }

  

  belongs_to :user
  has_one_attached :image
end
