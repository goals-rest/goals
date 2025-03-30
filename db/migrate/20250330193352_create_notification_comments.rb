class CreateNotificationComments < ActiveRecord::Migration[8.1]
  def change
    create_table :notification_comments do |t|
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
