class Entry < ApplicationRecord
  FEED_ENTRIES = %w[ Post ]

  delegated_type :entryable, types: %w[ Post Comment ], dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy, inverse_of: :parent
  has_many :mentions, dependent: :destroy, inverse_of: :entry, foreign_key: :entry_id

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates_associated :entryable

  scope :posts_owned_by, ->(owner) { where(owner: owner, entryable_type: "Post") }

  scope :visible, ->(current_user) do
    where(owner: current_user).or(Entry.where(owner: current_user.followees))
  end

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
end
