class Entry < ApplicationRecord
  FEED_ENTRIES = %w[ Post ]

  delegated_type :entryable, types: %w[ Post ], dependent: :destroy

  has_many :likes, class_name: "Entry::Like", dependent: :destroy

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates_associated :entryable

  scope :feed, ->(owner: Current.user) do
    where(entryable_type: FEED_ENTRIES)
      .where(owner:)
      .or(Entry.where(owner: owner.followees))
  end

  def self.build_with_post(post, owner: Current.user)
    [ post, build(entryable: post, owner:) ]
  end
end
