FactoryGirl.define do
  factory :task do
    text "test_tasks"
    completed  "false"
    user
  end
end