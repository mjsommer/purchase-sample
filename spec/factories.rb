FactoryGirl.define do
  sequence(:name) { |n| "User#{n} Doe"}
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    name
    email
  end
end
