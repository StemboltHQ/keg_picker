FactoryGirl.define do
  factory :user do
    sequence(:email) { |x|"winniethepooh#{x}@example.com" }
    sequence(:username) { |x| "Pooh#{x}" }
    password "12345678"
    password_confirmation "12345678"

    factory :admin do
      email "admin@example.com"

      after(:create) do |user|
        user.add_role :admin
      end
    end

  end
end
