FactoryGirl.define do
  factory :project do
    title { Faker::Name.title }
    user
  end
end