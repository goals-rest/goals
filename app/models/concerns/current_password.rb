module CurrentPassword
  extend ActiveSupport::Concern

  included do
    attribute :new_password
    attribute :current_password

    validates :new_password, presence: true, if: -> { current_password.present? }
    validate :current_password_is_correct
  end

  private
  def current_password_is_correct
    return if current_password.nil?
    return if new_password.blank? && current_password.blank?

    if authenticate(current_password)
      self.password = new_password
    else
      errors.add(:current_password, :invalid_current_password)
    end
  end
end
