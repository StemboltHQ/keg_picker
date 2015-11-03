FactoryGirl.define do
  factory :ballot do
    association :user
    association :beer
  end
end
