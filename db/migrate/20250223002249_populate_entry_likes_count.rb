class PopulateEntryLikesCount < ActiveRecord::Migration[8.1]
  def up
    Entry.find_each do |entry|
      Entry.reset_counters(entry.id, :likes)
    end
  end
end
