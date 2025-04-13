class CreateNotificationFollows < ActiveRecord::Migration[8.1]
  def change
    create_table :notification_follows do |t|
      t.references :follow, null: false, foreign_key: true

      t.timestamps
    end
  end
end
