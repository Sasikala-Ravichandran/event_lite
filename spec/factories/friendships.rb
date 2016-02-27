FactoryGirl.define do
  factory :friendship do
    user
    friend
    verified false
  end
end
