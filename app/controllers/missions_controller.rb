class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission).ongoing
    @campaigns = current_user.campaigns
  end

  def show
    @mission = Mission.find(params[:id])
    @package = @mission.package
    @campaign = @package.campaign

    #calcul of done missions
    missions = @campaign.missions
    missions_done = missions.select { |mission| mission.status == "done" }
    volumes_done = []
    missions_done.each do |mission_done|
      volumes_done << mission_done.package.quantity
    end
    @volume_done = volumes_done.sum

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

  def update
    @mission = Mission.find(params[:id])
    authorize @mission
    @mission.update(status: 'done', completed_at: DateTime.now)
    redirect_to missions_path
  end
end
