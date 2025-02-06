class Post < ApplicationRecord
  includes Entryable

  has_many_attached :images do |attachable|
    attachable.variant :large, resize_to_limit: [ 1200, 1200 ], preprocessed: true
    attachable.variant :medium, resize_to_limit: [ 600, 600 ], preprocessed: true
  end

  belongs_to :goal_progress_change, class_name: "Goal::ProgressChange", optional: true, foreign_key: "goal_progress_change_id"

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { maximum: 60 }
  validates :images,
            content_type: {
              with: %w[image/png image/jpeg image/gif image/webp],
              message: :content_type
            },
            limit: { max: 5, message: :limit },
            size: { less_than_or_equal_to: 8.megabytes, message: :size }
end
