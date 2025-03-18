FactoryBot.define do
  factory :entry_like, class: "Entry::Like" do
    association :entry, factory: [ :entry, :post ]
    association :user
  end
end
