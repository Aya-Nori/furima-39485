FactoryBot.define do
  factory :purchase_shipment do
    address = Gimei.address
    
    postcode { '123-4567' }
    region_id { Faker::Number.between(from: 2, to: 48) }
    city { address.city.kanji }
    area_number { '1-1' }
    building { '東京ハイツ' }
    tell { '09012341234' }

  end
end
