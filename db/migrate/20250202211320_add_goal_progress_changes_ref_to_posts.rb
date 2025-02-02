class AddGoalProgressChangesRefToPosts < ActiveRecord::Migration[8.1]
  def change
    add_reference :posts, :goal_progress_change, null: true, foreign_key: true
  end
end
