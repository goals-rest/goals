FactoryBot.define do
  factory :goal do
    association :user

    title { "Read 10 books" }
    description { "In 2025, I want to read 10 books." }
    start_date { Time.zone.today }
    current { 0 }
    target { 10 }

    trait :public do
      visibility { :public }
    end

    trait :private do
      visibility { :private }
    end
  end
end
