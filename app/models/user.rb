class User < ApplicationRecord
  include Followable, CurrentPassword

  has_secure_password

  enum :profile_visibility, %i[public private], default: :public, suffix: :profile

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fit: [ 256, 256 ], preprocessed: true
  end

  has_many :sessions, dependent: :destroy
  has_many :goals, dependent: :destroy

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
