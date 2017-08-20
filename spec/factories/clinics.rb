FactoryGirl.define do
  factory :clinic do
    sequence(:title) { |n| "Клиника #{n}" }
    sequence(:email) { |n| "clinic#{n}@clinic.com" }
    sequence(:phone) { |n| "#{n}12345" }
    address
  end
end
