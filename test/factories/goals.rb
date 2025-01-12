FactoryBot.define do
  factory :goal do
    title { "Read 10 books" }
    description { "In 2025, I want to read 10 books." }
    start_date { Time.zone.today }
    end_date { 1.year.from_now }
    current { 0 }
    target { 10 }
  end
end
