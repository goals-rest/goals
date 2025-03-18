class Notification::Like < ApplicationRecord
  include Notifiable

  belongs_to :entry_like, class_name: "Entry::Like"
end
