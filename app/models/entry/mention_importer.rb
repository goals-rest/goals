class Entry::MentionImporter
  def initialize(entry)
    @entry = entry
  end

  def import
    new_mentions.each(&:save)
  end

  private
  def new_mentions
    new_mentioned_users.map do |user|
      @entry.mentions.build(mentionee: user, mentioner: @entry.owner)
    end
  end

  def new_mentioned_users
    @_new_mentioned_users ||= @entry.owner
                                    .followers
                                    .where(username: new_mentioned_handles.map(&:username))
  end

  def new_mentioned_handles
    @entry.extract_handles.uniq - @entry.mentioned_handles
  end
end
