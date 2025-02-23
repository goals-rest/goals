class Entry::Like < ApplicationRecord
  belongs_to :entry, touch: true, counter_cache: true
  belongs_to :user

  validates :user, uniqueness: { scope: :entry }

  after_save :touch_entryable
  after_destroy :touch_entryable

  private
  def touch_entryable
    entry.entryable&.touch
  end
end
