class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def my_missions?
    true
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    show?
  end

  def show?
    record.user == user
  end

end
