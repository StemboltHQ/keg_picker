FactoryGirl.define do
  factory :beer do
    brewery { ["Phillips", "Hoyne", "Driftwood"].sample }
    sequence(:name) { |n| "#{["Pilsner", "Lager", "Pale Ale", "IPA", "Stout"].sample} ##{n}" }
  end
end
