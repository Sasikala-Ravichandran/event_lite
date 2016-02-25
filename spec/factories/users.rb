FactoryGirl.define do

  factory :user, aliases: [:creator] do
    
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  
    transient do
      events_count 5
    end

    factory :user_with_attending_events do
      after(:create) do |user, evaluator|
        (0...evaluator.events_count).each do |i|
          user.events << FactoryGirl.create(:event)
        end
      end
    end
  end  
end
