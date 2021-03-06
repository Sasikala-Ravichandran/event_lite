FactoryGirl.define do
  factory :event do
    name { Faker::Name.name } 
    start_date { Faker::Date.forward(23) }
    start_time { Faker::Time.forward(23, :morning) }
    venue { Faker::Lorem.sentence }
    association :creator, factory: :user
  end
end
