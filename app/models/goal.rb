class Goal < ApplicationRecord
  enum :status, [ :pending, :completed ]

  validates :title, presence: true
  validates :start_date, presence: true
  validates :current, presence: true
  validates :target, presence: true

  validates :title, length: { maximum: 60 }
  validates :description, length: { maximum: 100 }

  validate :end_date_after_start_date

  scope :search, ->(title) { where("LOWER(title) LIKE ?", "%#{title.downcase}%") if title.present? }

  def progress
    current / target
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || end_date.after?(start_date)

    errors.add(:end_date, :before_start_date)
  end
end
