class OrganisationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin
  end

  def create?
    return true
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
    # - record: the organisation passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
