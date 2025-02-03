class Post < ApplicationRecord
  includes Entryable

  belongs_to :goal_progress_change, class_name: "Goal::ProgressChange", optional: true, foreign_key: "goal_progress_change_id"

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { maximum: 60 }
end
