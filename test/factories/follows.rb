FactoryBot.define do
  factory :follow do
    association :follower, factory: :user
    association :followee, factory: :user
  end
end
