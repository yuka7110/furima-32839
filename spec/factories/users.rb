FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password = Faker::Internet.password
    password { password }
    password_confirmation { password }
    last_name { 'ユーザー' }
    first_name { '花子' }
    last_name_kana { 'テスト' }
    first_name_kana { 'ユーザー' }
    birthday { Faker::Date.birthday }
  end
end
