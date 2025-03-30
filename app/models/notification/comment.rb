class Notification::Comment < ApplicationRecord
  include Notifiable

  belongs_to :entry

  def recipients
    User.where(id: entry.owner_id)
  end
end
