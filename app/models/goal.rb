class Goal < ApplicationRecord
  enum :status, [ :pending, :completed ]

  validates :title, presence: true
  validates :start_date, presence: true
  validates :current, presence: true
  validates :target, presence: true

  validates :title, length: { maximum: 60 }
  validates :description, length: { maximum: 100 }

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date&.after?(start_date)

    errors.add(:end_date, :before_start_date)
  end
end
