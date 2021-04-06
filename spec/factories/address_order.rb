FactoryBot.define do
  factory :address_order do
    post_num { '123-1234' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '新宿5-5-5' }
    building { '東京ハイツ' }
    phone_num { '08010759437' }
    token { 'test_token' }
  end
end
