FactoryGirl.define do
  factory :event do
    user
    date     { Faker::Time.date }
    name     { Faker::Name.name }
  end
end
