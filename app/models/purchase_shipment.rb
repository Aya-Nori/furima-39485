class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :region_id, :city, :area_number, :building, :tell, :token
  validates :token, presence: true

  with_options presence: true do
    validates :user_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. 全角文字を使用してください"}
    validates :area_number
    validates :tell, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. 10-11桁の半角数で入力してください"}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipment.create(tell: tell, postcode: postcode, region_id: region_id, city: city, area_number: area_number, building: building, purchase_id: purchase.id)
  end
end
