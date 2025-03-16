FactoryBot.define do
  factory :notification do
    notifiable { create(:notification_like) }
  end
end
