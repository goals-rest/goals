class GoalPolicy < ApplicationPolicy
  def edit?
    owner?
  end
end
