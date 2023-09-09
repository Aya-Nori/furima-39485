FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    
    nickname { Faker::Name.initials(number: 8) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth { Faker::Date.birthday }
    name_sei { [person.first.kanji, person.first.hiragana, person.first.katakana].sample }
    name_mei { [person.first.kanji, person.first.hiragana, person.first.katakana].sample }
    name_sei_kana { person.last.katakana }
    name_mei_kana { person.first.katakana }
  end
end