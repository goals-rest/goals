class EntryPolicy < ApplicationPolicy
  def destroy?
    owner?
  end

  private
  def owner?
    record.owner_id == user&.id
  end
end
