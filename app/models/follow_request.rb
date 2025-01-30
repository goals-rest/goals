class FollowRequest < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: "requester_id"
  belongs_to :followee, class_name: "User", foreign_key: "followee_id"

  validates :requester, uniqueness: { scope: :followee }
  validate :the_requester_is_not_following_themselves

  def accept!
    transaction do
      requester.follows.create!(followee_id:)
      destroy!
    end
  end

  private
  def the_requester_is_not_following_themselves
    return if requester_id != followee_id

    errors.add(:base, :cannot_follow_themselves)
  end
end
