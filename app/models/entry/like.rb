class Entry::Like < ApplicationRecord
  belongs_to :entry, touch: true, counter_cache: true
  belongs_to :user

  has_many :notification_likes, class_name: "Notification::Like", dependent: :destroy, foreign_key: :entry_like_id

  validates :user, uniqueness: { scope: :entry }

  after_save :touch_entryable
  after_destroy :touch_entryable
  after_create_commit :notify_like_event

  private
  def touch_entryable
    entry.entryable&.touch
  end

  def notify_like_event
    ActiveSupport::Notifications.instrument "like.entry", self do
      Rails.logger.info "Like event published for Entry::Like with id: #{self.id}"
    end
  end
end
