class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  validates :image,         presence: true
  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1 }
  validates :condition_id,  numericality: { other_than: 1 }
  validates :fee_id,        numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id,        numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A[0-9]+\z/, greater_than: 300, less_than: 10000000, message: '¥300~¥9,999,999の間で半角数字を使用してください'} do
    validates :price,       presence: true
  end

  belongs_to :user
  has_one_attached :image
end
