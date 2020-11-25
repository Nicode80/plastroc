class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission)
  end
end
