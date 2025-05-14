class Goal::ProgressChange < ApplicationRecord
  belongs_to :goal, touch: true

  has_many :posts, dependent: :destroy, foreign_key: "goal_progress_change_id"

  validates :old_value, presence: true, numericality: true
  validates :new_value, presence: true, numericality: true
  validates :target, presence: true, numericality: true
  validate :old_value_is_different_than_new_value

  scope :with_created_at, ->(date) { where("DATE(goal_progress_changes.created_at) = ?", date) }

  def diff
    new_value - old_value
  end

  def remaining
    target - new_value
  end

  def self.log_change!(goal, old_value, new_value)
    params = { old_value:, new_value:, target: goal.target }

    goal.progress_changes.create!(params)
  end

  private
  def old_value_is_different_than_new_value
    return if old_value != new_value

    errors.add(:new_value, :invalid)
  end
end
