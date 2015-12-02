FactoryGirl.define do
  factory :ballot do
    poll
    association :user
    association :beer
  end
end
