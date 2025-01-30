FactoryBot.define do
  factory :post do
    title { "Some title" }
    body { "Some body" }

    association :owner, factory: :user
  end
end
