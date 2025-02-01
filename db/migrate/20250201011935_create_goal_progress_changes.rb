class CreateGoalProgressChanges < ActiveRecord::Migration[8.1]
  def change
    create_table :goal_progress_changes do |t|
      t.decimal :old_value, precision: 10, scale: 2, null: false, default: 0
      t.decimal :new_value, precision: 10, scale: 2, null: false, default: 0
      t.decimal :target, precision: 10, scale: 2, null: false, default: 0
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
