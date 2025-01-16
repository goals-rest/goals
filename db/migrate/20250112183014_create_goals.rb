class CreateGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :description
      t.datetime :start_date, null: false
      t.datetime :end_date
      t.decimal :current, precision: 10, scale: 2, null: false, default: 0
      t.decimal :target, precision: 10, scale: 2, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
