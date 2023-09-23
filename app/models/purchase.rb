class Purchase < ApplicationRecord
  has_one :shipment
  belongs_to :user
  belongs_to :item
end
