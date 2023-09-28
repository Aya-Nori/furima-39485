FactoryBot.define do
  factory :purchase_shipment do
    postcode { '123-4567' }
    region_id { 2 }
    city { '東京都' }
    area_number { '1-1' }
    building { '東京ハイツ' }
    tell { '09012341234' }
  end
end
