class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.organisation
        scope.where(organisation: user.organisation)
      else
        scope.all
      end
    end
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
>>>>>>> master
end
