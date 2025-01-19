class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true

  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def name
    "#{first_name} #{last_name}"
  end
end
