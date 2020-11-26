require 'rails_helper'

RSpec.describe UserHistory, type: :model do
  before do
    @user_history = FactoryBot.build(:user_history)
  end

  describe '購入テスト' do
    context '購入がうまくいく場合' do
      it '全ての情報が正しく入力されている場合' do
        expect(@user_history).to be_valid
      end
    end
    context '購入が上手くいかない時' do
      it '郵便番号が入力されていない場合' do
        @user_history.postal_coad = nil
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Postal coad can't be blank", "Postal coad is invalid. Input full-width characters.")
      end
      it '都道府県が入力されていない場合' do
        @user_history.pref_id = 1
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Pref must be other than 1")
      end
      it '市町村が入力されていない場合' do
        @user_history.city = nil
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていない場合' do
        @user_history.addresses_coad = nil
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Addresses coad can't be blank")
      end
      it '電話番号が入力されていない場合' do
        @user_history.telephone = nil
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'トークンが空の状態の場合' do
        @user_history.token = nil
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号にハイフンが含まれていない' do
        @user_history.postal_coad = 1234567
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Postal coad is invalid. Input full-width characters.")
      end
      it '電話番号が12桁以上ある場合' do
        @user_history.telephone = 123456789012345
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Telephone must be less than or equal to 99999999999")
        # expect(@user_history.errors.full_messages).to include('is too long (maximum is 11 characters)')
      end
      it '電話番号にハイフンが含まれている' do
        @user_history.telephone = 123-4567-890
        @user_history.valid?
        expect(@user_history.errors.full_messages).to include("Telephone must be greater than or equal to 1")
        # expect(@user_history.errors.full_messages).to include('is not a number')
      end
    end
  end
end