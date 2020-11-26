class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission)
  end

  def create
    @mission = Mission.new
    @mission.user = current_user
    @package = Package.find(params[:package_id])
    @mission.package = @package
    if @mission.save!
      redirect_to mission_path(@mission)
    else
      redirect_to campaign_path(@package.mission)
    end
    authorize @mission
  end
end
