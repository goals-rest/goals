class Notification < ApplicationRecord
  delegated_type :notifiable, types: %w[], dependent: :destroy
end
