FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 8)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_sei {Faker::Name}
    name_mei {Faker::Name}
    name_sei_kana {Faker::Name}
    name_mei_kana {Faker::Name}
    birth {Faker::Date.birthday}
  end
end