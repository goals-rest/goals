class Notification < ApplicationRecord
  delegated_type :notifiable, types: %w[ Notification::Like ], dependent: :destroy

  delegate :recipients, to: :notifiable
end
