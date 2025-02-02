FactoryBot.define do
  factory :entry_like, class: "Entry::Like" do
    entry
    user
  end
end
