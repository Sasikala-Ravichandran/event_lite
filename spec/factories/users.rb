FactoryGirl.define do

  factory :user, aliases: [:creator, :friend] do
    
    first_name { Faker::Name.first_name }
    last_name {  Faker::Name.last_name }
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
          user.friends
        end
      end
    end

  end  
end
