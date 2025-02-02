class RemoveOwnerReferenceFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_reference(:posts, :owner, index: true, foreign_key: { to_table: :users })
  end
end
