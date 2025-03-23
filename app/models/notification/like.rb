class Notification::Like < ApplicationRecord
  include Notifiable

  belongs_to :entry_like, class_name: "Entry::Like"

  def recipients
    User.where(id: entry_like.entry.owner_id)
  end
end
