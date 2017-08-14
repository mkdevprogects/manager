FactoryGirl.define do
  factory :specialization do
    sequence(:doctor_title) { |n| "специализция #{n}" }
    clinic_title {|s| "#{s.doctor_title}ия" }
    sequence(:alias_name) { |n|  "spec#{n}" }
  end
end
