class CreateGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :subtitle
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :target, null: false
      t.string :target_type, null: false
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
