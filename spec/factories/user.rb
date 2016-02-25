FactoryGirl.define do

  factory :user do |f|
    f.email     { Faker::Internet.email }
    f.password  { Faker::Internet.password(8) }
    role "user"
  end

  factory :admin, class: User do
    email "admin@factory.com"
    password  "12345678"
    role "admin"
  end
end