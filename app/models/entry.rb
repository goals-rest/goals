class Entry < ApplicationRecord
  delegated_type :entryable, types: %w[], dependent: :destroy

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates_associated :entryable

  def self.build_with_post(post, owner: Current.user)
    [ post, build(entryable: post, owner:) ]
  end
end
