FactoryGirl.define do
  factory :beer do
    sequence(:name) { |n| "Keg ##{ n }" }
  end
end
