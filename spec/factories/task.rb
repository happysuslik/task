FactoryGirl.define do
  factory :task do
    text "test_tasks"
    completed  "false"
    priority 0
    deadline "2016-02-03 00:10:00.000000"
    project
  end
end