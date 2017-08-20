FactoryGirl.define do
  factory :doctor do
    name
    surname
    sequence(:email) { |n| "doctor#{n}@doctor.com" }
  end
end
