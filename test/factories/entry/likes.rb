FactoryBot.define do
  factory :entry_like, class: "Entry::Like" do
    entry { create(:entry, :post) }
    user
  end
end
