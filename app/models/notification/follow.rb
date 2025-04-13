class Notification::Follow < ApplicationRecord
  include Notifiable

  belongs_to :follow

  def recipients
    User.where(id: follow.followee_id)
  end
end
