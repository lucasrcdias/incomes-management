FactoryBot.define do
  factory :entry do
    value { 100 }
    description { FFaker::Lorem.word }

    association :user
    association :category
  end
end
