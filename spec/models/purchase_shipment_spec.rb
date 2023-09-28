require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do

  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: user.id)
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
        expect(@purchase_shipment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_shipment.region_id = '1'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_shipment.city = ''
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("City can't be blank", "City is invalid. 全角文字を使用してください")
      end
      it '番地が空だと保存できないこと' do
      end
      it '電話番号が9桁以下では保存できないこと' do
      end
      it '電話番号が12桁以上では保存できないこと' do
      end
      it '電話番号が全角数字では保存できないこと' do
      end
      it '電話番号に半角ハイフンがあると保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
    end
  end

end
