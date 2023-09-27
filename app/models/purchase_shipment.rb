class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :region_id, :city, :area_number, :building, :tell

  with_options presence: true do
    validates :user_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipment.create(tell: tell, postcode: postcode, region_id: region_id, city: city, area_number: area_number, building: building, purchase_id: purchase.id)
  end
end
