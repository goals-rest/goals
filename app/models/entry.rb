class Entry < ApplicationRecord
  FEED_ENTRIES = %w[ Post ]

  delegated_type :entryable, types: %w[ Post Comment ], dependent: :destroy
  delegate :extract_handles, to: :entryable
  delegate :content, to: :entryable

  has_many :likes, dependent: :destroy
  has_many :notification_comments, class_name: "Notification::Comment", dependent: :destroy
  has_many :comments, dependent: :destroy, inverse_of: :parent
  has_many :mentions, dependent: :destroy, inverse_of: :entry, foreign_key: :entry_id
  has_many :mentioned_users, through: :mentions, source: :mentionee

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates_associated :entryable

  scope :posts_owned_by, ->(owner) { where(owner: owner, entryable_type: "Post") }

  scope :visible, ->(current_user) do
    where(owner: current_user).or(Entry.where(owner: current_user.followees))
  end

  after_create_commit :sync_mentions_later

  scope :feed, ->(owner: Current.user) do
    visible(owner).where(entryable_type: FEED_ENTRIES)
  end

  def self.build_with_post(post, owner: Current.user)
    [ post, build(entryable: post, owner:) ]
  end

  def self.build_with_comment(comment, owner: Current.user)
    [ comment, build(entryable: comment, owner:) ]
  end

  def liked?(user: Current.user)
    likes.exists?(user:)
  end

  def like_for(user)
    return if user.blank?

    likes.find_by(user_id: user.id)
  end

  def sync_mentions_later
    MentionSyncerJob.perform_later(self)
  end

  def mentioned_handles
    mentioned_users.map { Handle.new(it.handle) }
  end

  def render_content
    Renderer.new(self).render.html_safe
  end
end
