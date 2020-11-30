class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def show?
    record.user == user
  end

end
