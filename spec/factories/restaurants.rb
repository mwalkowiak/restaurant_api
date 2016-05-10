FactoryGirl.define do
  factory :restaurant do
    name Faker::Lorem.word
    description Faker::Lorem.sentence
    rating 4.3
    address Faker::Address.street_address
  end
end
