FactoryBot.define do
  factory :goal_progress_change, class: "Goal::ProgressChange" do
    association :goal

    new_value { 10 }
    old_value { 0 }
    target { 10 }
  end
end
