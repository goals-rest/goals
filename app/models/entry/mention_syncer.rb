class Entry::MentionSyncer
  def initialize(entry)
    @entry = entry
  end

  def sync
    destroy_removed_mentions
    create_new_mentions
  end

  private
  def destroy_removed_mentions
    removed_mentions.destroy_all
  end

  def create_new_mentions
    new_mentions.each(&:save)
  end

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
    current_mentioned_handles
      .reject { existing_mentioned_usernames.include?(it.username) }
  end

  def current_mentioned_handles
    @_handlers ||= @entry.mentioned_handles.uniq.to_set
  end

  def removed_mentions
    @entry.mentions
          .joins(:mentionee)
          .where(mentionee: User.where(username: removed_mentioned_usernames))
  end

  def removed_mentioned_usernames
    existing_mentioned_usernames - current_mentioned_handles.map(&:username)
  end

  def existing_mentioned_usernames
    @_existing_mentioned_usernames = @entry.mentions
                                           .joins(:mentionee)
                                           .pluck(:username)
                                           .to_set
  end
end
