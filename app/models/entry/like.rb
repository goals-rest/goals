class Entry::Like < ApplicationRecord
  belongs_to :entry, touch: true
  belongs_to :user

  validates :user, uniqueness: { scope: :entry }
end
