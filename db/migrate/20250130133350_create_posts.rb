class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
