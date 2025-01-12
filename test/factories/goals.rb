FactoryBot.define do
  factory :goal do
    title { "Read 10 books" }
    subtitle { "In 2025, I want to read 10 books." }
    start_date { Time.zone.today }
    end_date { 1.year.from_now }
    target { 10 }
    target_type { "number" }
  end
end
