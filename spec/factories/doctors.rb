FactoryGirl.define do
  factory :doctor do
    name
    surname
    patronymic
    sequence(:email) { |n| "doctor#{n}@doctor.com" }
    phone
  end
end
