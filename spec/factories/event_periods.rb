FactoryGirl.define do
  factory :event_period do
    name   { Faker::Lorem.word }
    days   { rand(10) }
    months { rand(10) }
    years  { rand(10) }
  end
end
