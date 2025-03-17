FactoryBot.define do
  factory :notification_like, class: "Notification::Like" do
    association :entry_like
  end
end
