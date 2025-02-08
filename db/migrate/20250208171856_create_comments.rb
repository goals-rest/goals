class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false, limit: 2200
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
