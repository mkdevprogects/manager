FactoryGirl.define do
  factory :admin do
    name
    surname
    sequence(:email) { |n| "admin#{n}@admin.com" }
    password '123123'
  end
end
