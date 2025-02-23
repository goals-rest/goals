class AddLikesCountToEntries < ActiveRecord::Migration[8.1]
  def change
    add_column :entries, :likes_count, :integer, default: 0, null: false
  end
end
