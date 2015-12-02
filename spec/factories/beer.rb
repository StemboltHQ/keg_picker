FactoryGirl.define do
  factory :beer do
    sequence(:brand) { |n| "Keg ##{ n }" }
  end
end

