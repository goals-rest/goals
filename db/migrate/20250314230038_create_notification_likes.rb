class CreateNotificationLikes < ActiveRecord::Migration[8.1]
  def change
    create_table :notification_likes do |t|
      t.references :entry_like, null: false, foreign_key: true

      t.timestamps
    end
  end
end
