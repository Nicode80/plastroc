class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def my_campaigns?
    true
  end

  def dashboard?
    record.user == user
  end

  def publish?
    record.user == user
  end

  def pause?
    update?
  end

  def finish?
    update?
  end

  def duplicate?
    update?
  end

  def create?
    return true
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
