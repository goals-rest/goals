class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :followee, class_name: "User", foreign_key: "followee_id"

  validates :follower, uniqueness: { scope: :followee }
  validate :the_follower_is_not_following_themself

  private
  def the_follower_is_not_following_themself
    return if follower_id != followee_id

    errors.add(:base, "The follower cannot be equal to the followee")
  end
end
