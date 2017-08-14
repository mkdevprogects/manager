FactoryGirl.define do
  factory :specialization do
    doctor_title { |n| "специализция #{n}" }
    clinic_title "#{doctor_title}ия"
    alias_name { |n|  /[a-z]{8}/ + "#{n}" }
  end
end
