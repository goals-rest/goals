class CreateNotifications < ActiveRecord::Migration[8.1]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
