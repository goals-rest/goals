class Mention < ApplicationRecord
  belongs_to :entry, optional: true, inverse_of: :mentions
  belongs_to :mentioner, class_name: "User"
  belongs_to :mentionee, class_name: "User"

  def url
    Rails.application.routes.url_helpers.profile_path(mentionee.username)
  end
end
