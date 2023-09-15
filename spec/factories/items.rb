FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 40) }
    description { Faker::Lorem.characters(number: 1000) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    category { Category.where.not(id: 1).sample }
    condition { Condition.where.not(id: 1).sample }
    charge { Charge.where.not(id: 1).sample }
    region { Region.where.not(id: 1).sample }
    estimate { Estimate.where.not(id: 1).sample }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
