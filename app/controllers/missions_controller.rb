class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission)
    @organisations = current_user.organisations
  end

  def show
    @mission = Mission.find(params[:id])
    @package = @mission.package
    @campaign = @package.campaign

    #calcul of done missions
    @missions = @campaign.missions
    # @result = @missions.select { |mission| mission.satus == done }


    authorize @mission
  end

  def new
    @mission = Mission.new
    @package = Package.find(params[:package_id])
    @campaign = Campaign.find(params[:campaign_id])
    authorize @mission
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
