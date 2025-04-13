class Notification < ApplicationRecord
  delegated_type :notifiable,
    types: %w[ Notification::Like Notification::Comment Notification::Follow],
    dependent: :destroy

  has_many :user_notifications, dependent: :destroy

  delegate :recipients, to: :notifiable

  def deliver_later
    ::Notifications::SendNotificationsJob.perform_later(self)
  end
end
