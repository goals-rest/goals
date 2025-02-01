class Goal::ProgressChange < ApplicationRecord
  belongs_to :goal

  validates :old_value, presence: true
  validates :new_value, presence: true
  validates :target, presence: true

  def diff
    new_value - old_value
  end

  def self.log_change!(goal, old_value, new_value)
    params = { old_value:, new_value:, target: goal.target }

    goal.progress_changes.create!(params)
  end
end
