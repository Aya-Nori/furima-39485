require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    end

  describe 'ユーザー新規登録' do

    context '商品登録できる時' do
      it '必要な項目が入力、選択されていれば新規登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できない時' do
      it '画像が選択されていないときは商品登録できない' do
      end
      it '商品名がないときは商品登録できない' do
      end
      it '商品の説明がないときは商品登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが選択されていないときは商品登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないときは商品登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が選択されていないときは商品登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '配送元の地域が選択されていないときは商品登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '配送までの日数が選択されていないときは商品登録できない' do
        @item.estimate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimate can't be blank")
      end
      it '価格が入力されていないときは商品登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数が入力されていないときは商品登録できない。全角数字では登録できない。' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end

  end
end