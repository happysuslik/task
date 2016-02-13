FactoryGirl.define do

  factory :user do
    email "email1@factory.com"
    password  "12345678"
    role "user"
  end

  factory :admin, class: User do
    email "admin@factory.com"
    password  "12345678"
    role "admin"
  end
end