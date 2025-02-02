class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries do |t|
      t.string :entryable_type, null: false
      t.integer :entryable_id, null: false
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :entries, %i[entryable_id entryable_type], unique: true
  end
end
