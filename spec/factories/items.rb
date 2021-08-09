FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials(number: 2) }
    description { Faker::Quote.famous_last_words }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_time_id { Faker::Number.between(from: 2, to: 4) }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/timage.png'), filename: 'timage.png')
    end
  end
end
