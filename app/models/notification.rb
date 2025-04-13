class Notification < ApplicationRecord
  delegated_type :notifiable, types: %w[ Notification::Like Notification::Comment], dependent: :destroy

  has_many :user_notifications, dependent: :destroy

  delegate :recipients, to: :notifiable
end
