FactoryGirl.define do
  factory :menu_item do
    name Faker::Lorem.word
    description Faker::Lorem.sentence
    category_id 3
  end
end
