FactoryGirl.define do
  factory :beer do
    sequence(:name) { |n| "Beer ##{n} #{["Pilsner", "Lager", "Pale Ale", "IPA", "Stout"]}" }
  end
end
