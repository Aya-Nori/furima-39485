require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  describe '購入者情報の保存' do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
  before do
      @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: user.id, item_id: item.id)
    end

    context '購入者の記入内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipment).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchase_shipment.building = ''
        expect(@purchase_shipment).to be_valid
      end
    end

    context '購入者の記入内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_shipment.postcode = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipment.postcode = '1231234'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_shipment.region_id = '1'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_shipment.city = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("City can't be blank", 'City is invalid. 全角文字を使用してください')
      end
      it '番地が空だと保存できないこと' do
        @purchase_shipment.area_number = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Area number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_shipment.tell = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Tell can't be blank", 'Tell is invalid. 10-11桁の半角数で入力してください')
      end
      it '電話番号が9桁以下では保存できないこと' do
        @purchase_shipment.tell = '090123412'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Tell is invalid. 10-11桁の半角数で入力してください')
      end
      it '電話番号が12桁以上では保存できないこと' do
        @purchase_shipment.tell = '090123412345'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Tell is invalid. 10-11桁の半角数で入力してください')
      end
      it '電話番号が全角数字では保存できないこと' do
        @purchase_shipment.tell = '０９０１２３４１２３４'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Tell is invalid. 10-11桁の半角数で入力してください')
      end
      it '電話番号に半角ハイフンがあると保存できないこと' do
        @purchase_shipment.tell = '090-1234-1234'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Tell is invalid. 10-11桁の半角数で入力してください')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipment.user_id = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipment.item_id = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_shipment.token = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
