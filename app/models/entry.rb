class Entry < ApplicationRecord
  delegated_type :entryable, types: %w[], dependent: :destroy

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
end
