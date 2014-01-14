FactoryGirl.define do
  factory :event do
    user
    event_period
    date     { Faker::Time.date }
    name     { Faker::Name.name }
  end
end
