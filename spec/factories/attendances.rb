FactoryGirl.define do
  factory :attendance do
    user
    event
    accepted false
  end
end
