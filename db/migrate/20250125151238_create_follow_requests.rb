class CreateFollowRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :follow_requests do |t|
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :followee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :follow_requests, %i[requester_id followee_id], unique: true
  end
end
