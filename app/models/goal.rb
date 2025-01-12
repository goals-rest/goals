class Goal < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :current, presence: true
  validates :target, presence: true

  validates :title, length: { maximum: 60 }
  validates :description, length: { maximum: 100 }

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.after?(start_date)

    errors.add(:end_date, "não pode ser menor do que a data de início")
  end
end
