FactoryBot.define do
  factory :mention do
    association :entry, factory: :entry
    association :mentioner, factory: :user
    association :mentionee, factory: :user
  end
end
