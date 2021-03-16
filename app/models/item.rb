class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: '¥300~¥9,999,999の間で入力してください'

  belongs_to :user
  has_one_attached :image
  has_one :order
end
