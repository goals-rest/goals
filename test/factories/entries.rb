FactoryBot.define do
  factory :entry do
    trait :post do
      entryable { create(:post) }
    end

    trait :comment do
      entryable { create(:comment, parent: create(:entry, :post)) }
    end

    association :owner, factory: :user
  end
end
