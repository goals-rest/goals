FactoryBot.define do
  factory :user_notification do
    association :user
    association :notification, factory: [ :notification, :like ]

    trait :read do
      read_at { Time.zone.now }
    end
  end
end
