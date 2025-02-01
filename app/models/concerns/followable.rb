module Followable
  extend ActiveSupport::Concern

  included do
    has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
    has_many :followees, through: :follows
    has_many :follows_as_followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
    has_many :followers, through: :follows_as_followee
    has_many :posts_of_followees, through: :followees, source: :posts
  end

  def follows?(user)
    return false if user.blank?

    followees.exists?(id: user.id)
  end

  def follow_for(user)
    follows.find_by(followee_id: user.id)
  end
end
