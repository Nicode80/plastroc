class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission)
    @organisations = current_user.organisations
  end

end
