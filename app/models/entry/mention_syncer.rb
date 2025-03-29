class Entry::MentionSyncer
  def initialize(entry)
    @entry = entry
  end

  def sync
    Entry::MentionImporter.new(@entry).import
    Entry::MentionCleaner.new(@entry).clean
  end
end
