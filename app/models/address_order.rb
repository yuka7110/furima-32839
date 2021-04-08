class AddressOrder
  include ActiveModel::Model
  attr_accessor :token, :post_num, :prefecture_id, :municipality, :address, :building, :phone_num, :user_id, :item_id
  

  with_options presence: true do
    validates :post_num, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_num, length: { maximum: 11 }
    validates :phone_num, numericality: { message: "半角数字のみ使用してください" }
    validates :municipality
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, prefecture_id: prefecture_id, municipality: municipality, address: address,
                   building: building, phone_num: phone_num, order_id: order.id)
  end
end
