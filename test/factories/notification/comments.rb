FactoryBot.define do
  factory :notification_comment, class: "Notification::Comment" do
    association :entry
  end
end
