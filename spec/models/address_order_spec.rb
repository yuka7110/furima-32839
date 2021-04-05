require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @address_order = FactoryBot.build(:address_order)
    end

    describe '購入ができる場合' do
      context '購入できるとき' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@address_order).to be_valid
        end
        it 'buildingは空でも保存できること' do
          @address_order.building = nil
          expect(@address_order).to be_valid
        end
      end

      context '購入できない時' do
        it 'post_numが空だと保存できない' do
          @address_order.post_num = nil
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("Post num can't be blank")
        end

        it 'post_numが半角ハイフンを含んだ正しい形式でないと保存できないこと' do
          @address_order.post_num = '1231234'
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include('Post num is invalid. Include hyphen(-)')
        end

        it 'prefecture_idを選択していないと保存できないこと' do
          @address_order.prefecture_id = 1
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'municipalityを選択していないと保存できないこと' do
          @address_order.municipality = nil
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("Municipality can't be blank")
        end

        it 'addressが空だと保存できない' do
          @address_order.address = nil
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numが空だと保存できない' do
          @address_order.phone_num = nil
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("Phone num can't be blank")
        end

        it 'phone_numが12文字以上だと保存できないこと' do
          @address_order.phone_num = '123456789012'
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
        end

        it 'tokenが空だと保存できない' do
          @address_order.token = nil
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("Token can't be blank")
        end

        it 'user_idが空では登録できないこと' do
          @address_order.user_id = nil
          @address_order.valid?
          expect(@address_order.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では登録できないこと' do
          @address_order.item_id = nil
          @address_order.valid?
          binding.pry
          expect(@address_order.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
