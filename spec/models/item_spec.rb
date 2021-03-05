require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品投稿できる場合' do
      context '出品できるとき' do
        it 'image, name, describe, category_id, condition_id, fee_id, prefecture_id, day_id, price,が存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end

      context '出品投稿できない場合' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'descriptionが空では登録できないこと' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'category_idが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Category is not a number')
        end

        it 'condition_idが空では登録できないこと' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition is not a number')
        end

        it 'fee_idが空では登録できないこと' do
          @item.fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Fee is not a number')
        end

        it 'prefecture_idが空では登録できないこと' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture is not a number')
        end

        it 'day_idが空では登録できないこと' do
          @item.day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Day is not a number')
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'userが紐づいてないと登録できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
