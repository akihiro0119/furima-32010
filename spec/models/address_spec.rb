require 'rails_helper'

RSpec.describe Address, type: :model do
    before do
      @adress = FactoryBot.build(:address)
    end
  
    describe '住所入力' do
      context '住所入力がうまくいく時' do
        it '全ての情報が正しく入力されている場合' do
          expect(@adress).to be_valid
        end
      end
    end
end
  
      