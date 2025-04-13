FactoryBot.define do
  factory :notification_follow, class: "Notification::Follow" do
    association :follow
  end
end
