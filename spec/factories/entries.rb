FactoryBot.define do
  factory :entry do
    value { 100 }

    association :user
    association :category
  end
end
