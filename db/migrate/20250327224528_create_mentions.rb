class CreateMentions < ActiveRecord::Migration[8.1]
  def change
    create_table :mentions do |t|
      t.references :entry, foreign_key: true
      t.references :mentioner, null: false, foreign_key: { to_table: :users }
      t.references :mentionee, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
