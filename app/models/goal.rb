class Goal < ApplicationRecord
  enum :status, [ :pending, :completed ]
  enum :visibility, [ :public, :private ], suffix: :goal, default: :public

  has_many :progress_changes, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :current, presence: true, numericality: true
  validates :target, presence: true, numericality: true

  validates :title, length: { maximum: 60 }
  validates :description, length: { maximum: 100 }

  validate :end_date_after_start_date

  scope :search, ->(title) { where("LOWER(title) LIKE ?", "%#{title.downcase}%") if title.present? }

  before_save :set_status
  after_update :log_progress

  def update_progress(new_current)
    return false if new_current.to_d == current

    update(current: new_current)
  end

  def progress
    return 0 if target.zero?

    current / target
  end

  def remaining_days
    return if end_date.blank?

    (end_date.to_date - start_date.to_date).to_i
  end

  def translated_status
    I18n.t("activerecord.attributes.goal.status.#{status}")
  end

  private
  def end_date_after_start_date
    return if end_date.blank? || end_date.after?(start_date)

    errors.add(:end_date, :before_start_date)
  end

  def set_status
    self.status = current >= target ? :completed : :pending
  end

  def log_progress
    return unless saved_change_to_current?

    Goal::ProgressChange.log_change!(self, current_previously_was, current)
  end
end
