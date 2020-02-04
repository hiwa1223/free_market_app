FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    first_name                  { "中村" }
    last_name                  { "花子" }
    first_name_kana             { "ナカムラ" }
    last_name_kana             { "ハナコ" }
    tel                   { "9999" }
    birthday              { "2020-11-11" }
    self_introduction     { "こんにちは" }
    point                 { "30" }
    proceed               { "3000" }

    trait :google_user do
      nickname {"mockuser"}
      email {"google@test.com"}
    end

    trait :google_user_build do
      nickname {"mockuser"}
      email {"google-build@test.com"}
    end
  end
end 
