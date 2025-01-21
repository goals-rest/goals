module Followable
  extend ActiveSupport::Concern

  included do
    has_many :follows, dependent: :destroy, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
    has_many :followees, through: :follows
  end

  def follows?(user)
    followees.exists?(id: user.id)
  end

  def follow_for(user)
    follows.where(followee_id: user.id).first
  end
end
