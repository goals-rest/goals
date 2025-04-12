class PostPolicy < ApplicationPolicy
  pre_check :allow_owner

  def show?
    owner_has_public_profile? || follows_owner?
  end

  private
  def allow_owner
    allow! if owner?
  end

  def owner?
    record.entry.owner_id == user&.id
  end

  def owner_has_public_profile?
    record.entry.owner.public_profile?
  end

  def follows_owner?
    return false if user.blank?

    user.follows?(record.entry.owner)
  end
end
