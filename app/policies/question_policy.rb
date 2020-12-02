class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.campaign.organisation.user == user
  end

  def destroy?
    record.campaign.organisation.user == user || user.admin
  end

  def seen?
    true
  end
end
