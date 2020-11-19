require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

  describe '商品出品' do

    context '商品出品がうまくいく時' do
  
      it "全ての情報が正しく入力されている場合" do
  
      expect(@item).to be_valid
         
      end
    end

    context '新規登録が上手くいかない時' do

      it "画像がアップロードされてない場合" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が入力されていない場合" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品名が40文字以上の場合" do
        @item.title = "あ" * 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it "商品の説明が入力されていない場合" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "商品の説明が1000文字以上の場合" do
        @item.explanation = "あ" * 10000
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it "カテゴリーが--の場合" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が--の場合" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担が--の場合" do
        @item.freight_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight must be other than 1")
      end
      it "発送元の地域が--の場合" do
        @item.area_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送までの日数が--の場合" do
        @item.shipdate_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate must be other than 1")
      end
      it "販売価格が300円未満の場合" do
        @item.price= 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が10000000円以上の場合" do
        @item.price= 88888888
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
