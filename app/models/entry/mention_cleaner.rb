class Entry::MentionCleaner
  def initialize(entry)
    @entry = entry
  end

  def clean
    removed_mentions.destroy_all
  end

  private
  def removed_mentions
    @entry.mentions
          .joins(:mentionee)
          .where(mentionee: User.where(username: removed_handles.map(&:username)))
  end

  def removed_handles
    @entry.mentioned_handles.reject do |handle|
      @entry.extract_handles.include?(handle)
    end
  end
end
