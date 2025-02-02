class Entry::Like < ApplicationRecord
  belongs_to :entry
  belongs_to :user

  validates :user, uniqueness: { scope: :entry }
end
