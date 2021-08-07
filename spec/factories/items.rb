FactoryBot.define do
  factory :item do
    item_name { "あああ" }
    description {'test'}
    price {5000}
    category_id {1}
    condition_id {1}
    shipping_charge_id {1}
    prefecture_id {2}
    shipping_time_id {2}

    association :user 

    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/timage.png'), (filename: 'timage.png')
  end
end
