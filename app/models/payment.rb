class Payment < ApplicationRecord
  validates :price, presence: true

  belongs_to :user
  has_one :shipment
end
