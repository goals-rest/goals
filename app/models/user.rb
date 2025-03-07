class User < ApplicationRecord
  include Followable, CurrentPassword

  has_secure_password

  enum :profile_visibility, %i[public private], default: :public, suffix: :profile

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fit: [ 256, 256 ], preprocessed: true
  end

  has_many :sessions, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :entries, dependent: :destroy, foreign_key: "owner_id"
  has_many :follow_requests, dependent: :destroy, foreign_key: "followee_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email_address, presence: true, uniqueness: true

  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }
  validates :username, length: { maximum: 255 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  before_validation :set_username, on: :create

  def name
    "#{first_name} #{last_name}"
  end

  def handle
    "@#{username}"
  end

  def allowed_to_view_profile?(user)
    user == self || public_profile? || user&.follows?(self)
  end

  def pending_follow_request_for?(user)
    return false if user.blank?

    follow_requests.exists?(requester_id: user.id)
  end

  def goals_progress_calendar
    GoalsProgressCalendarBuilder.new(self)
      .build(3.months.ago.beginning_of_month..Time.zone.now.end_of_month)
  end

  private
  def set_username
    return if username.present?

    self.username = name.parameterize(separator: ".").first(255)

    if User.exists?(username: self.username)
      self.username = self.username.first(248)
      self.username += ".#{SecureRandom.hex(3)}"
    end
  end
end
