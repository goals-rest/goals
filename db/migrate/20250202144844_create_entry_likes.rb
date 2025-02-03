class CreateEntryLikes < ActiveRecord::Migration[8.1]
  def change
    create_table :entry_likes do |t|
      t.references :entry, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :entry_likes, %i[entry_id user_id], unique: true
  end
end
