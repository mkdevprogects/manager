FactoryGirl.define do
  sequence :name do
    Faker::StarTrek.character
  end

  sequence :surname do
    Faker::LordOfTheRings.character
  end

  sequence :patronymic do
    Faker::LordOfTheRings.character
  end

  sequence :phone do |n|
    "7#{rand(500..999)}#{rand(10000..99999)}#{n}"
  end

  sequence :address do
    "#{Faker::Address.city}, #{Faker::Address.street_address}"
  end

  sequence :description do
    Faker::Hobbit.quote
  end
end
