class Notification::Comment < ApplicationRecord
  include Notifiable

  belongs_to :entry

  def recipients
    User.where(id: entry.comment.parent.owner_id)
  end
end
