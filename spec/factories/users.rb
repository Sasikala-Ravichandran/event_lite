FactoryGirl.define do
  factory :user, aliases: [:creator] do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
