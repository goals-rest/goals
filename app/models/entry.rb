class Entry < ApplicationRecord
  FEED_ENTRIES = %w[ Post ]

  delegated_type :entryable, types: %w[ Post ], dependent: :destroy

  has_many :likes, dependent: :destroy

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates_associated :entryable

  scope :visible, ->(current_user) do
    where(owner: current_user).or(Entry.where(owner: current_user.followees))
  end

  scope :feed, ->(owner: Current.user) do
    where(entryable_type: FEED_ENTRIES).visible(owner)
  end

  def self.build_with_post(post, owner: Current.user)
    [ post, build(entryable: post, owner:) ]
  end

  def liked?(user: Current.user)
    likes.exists?(user:)
  end

  def like_for(user)
    return if user.blank?

    likes.find_by(user_id: user.id)
  end
end
