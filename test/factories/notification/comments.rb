FactoryBot.define do
  factory :notification_comment, class: "Notification::Comment" do
    association :entry, factory: [ :entry, :comment ]
  end
end
