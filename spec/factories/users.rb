FactoryGirl.define do
  factory :user do
    sequence(:email) { |x|"winniethepooh#{x}@test.com" }
    sequence(:username) { |x| "Pooh#{x}" }
    password "12345678"
    password_confirmation "12345678"
  end
end
