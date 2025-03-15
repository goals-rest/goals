class Notification < ApplicationRecord
  delegated_type :notifiable, types: %w[ NotificationLike ], dependent: :destroy
end
