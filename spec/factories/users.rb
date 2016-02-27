FactoryGirl.define do

  factory :user, aliases: [:creator, :friend] do
    
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  
    transient do
      count 5
    end

    factory :user_with_attending_events do
      after(:create) do |user, evaluator|
        (0...evaluator.count).each do |i|
          user.events << FactoryGirl.create(:event)
        end
      end
    end

    factory :user_with_friends do
      after(:create) do |user, evaluator|
        (0...evaluator.count).each do |i|
          user.friends << FactoryGirl.create(:friend)
        end
      end
    end

  end  
end
