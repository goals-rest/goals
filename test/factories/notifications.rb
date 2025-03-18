FactoryBot.define do
  factory :notification do
    trait :like do
      notifiable { association :notification_like, notification: instance }
    end
  end
end
