FactoryBot.define do
  factory :entry do
    trait :post do
      entryable { create(:post) }
    end
  end
end
