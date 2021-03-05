FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price { 5000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
