class Entry::MentionSyncerJob < ApplicationJob
  queue_as :default

  def perform(entry)
    Entry::MentionSyncer.new(entry).sync
  end
end
