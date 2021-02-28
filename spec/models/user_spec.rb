require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe "ユーザー新規登録" do
      context '新規登録できるとき' do
        it 'nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthdayが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
          @user.password = 'abcde1'
          @user.password_confirmation = 'abcde1'
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailは、@がないと登録できないこと' do
          @user.email = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordは5文字以下では登録できないこと' do
          @user.password = 'abc12'
          @user.password_confirmation = 'abc12'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationは一致しないと登録できない' do
          @user.password = 'aaa111'
          @user.password_confirmation = 'aaa112'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'password:半角英数混合(半角英語のみ)' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end

        it 'last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'password：数字のみは登録できない' do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'password：全角英数混合は登録できない' do
          @user.password = "ａａａ１１１"
          @user.password_confirmation = "ａａａ１１１"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'email：emailが被っていた場合は登録できない（一意性）' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'last_name：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
          @user.last_name = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end

        it 'first_name：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
          @user.first_name = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end

        it '姓（フリガナ）：全角（カタカナ）以外は登録できない' do
          @user.last_name_kana = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
        end

        it '名（フリガナ）：全角（カタカナ）以外は登録できない' do
          @user.first_name_kana = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
        end


      end
    end
  end
end
