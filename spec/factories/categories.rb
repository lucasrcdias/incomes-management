FactoryBot.define do
  factory :category do
    name { FFaker::Name.name }
    icon { FFaker::Internet.slug }
    kind { Category.kinds.values.sample }
    planned { 100 }

    association :user
  end
end
