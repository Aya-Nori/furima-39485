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
      end
      it 'カテゴリーが選択されていないときは商品登録できない' do
        @item.category_id = 1
        # binding.pry
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないときは商品登録できない' do
      end
      it '配送料の負担が選択されていないときは商品登録できない' do
      end
      it '配送元の地域が選択されていないときは商品登録できない' do
      end
      it '配送までの日数が選択されていないときは商品登録できない' do
      end
      it '価格が入力されていないときは商品登録できない' do
      end
      it '価格に半角数が入力されていないときは商品登録できない' do
      end
    end

  end
end