class ApplicationPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  private
  def owner?
    record.user_id == user&.id
  end
end
