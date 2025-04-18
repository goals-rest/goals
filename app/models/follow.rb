class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :followee, class_name: "User", foreign_key: "followee_id"

  validates :follower, uniqueness: { scope: :followee }
  validate :the_follower_is_not_following_themselves

  after_create_commit :notify_follow_event

  private
  def the_follower_is_not_following_themselves
    return if follower_id != followee_id

    errors.add(:base, :cannot_follow_themselves)
  end

  def notify_follow_event
    ActiveSupport::Notifications.instrument "follow", self do
      Rails.logger.info "Event published for Follow with id: #{self.id}"
    end
  end
end
