FactoryBot.define do
  factory :order_address do
    postal_code { Faker::Number.numerify('###-####')}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Company.name }
    phone_number { Faker::Number.numerify('###########')}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
