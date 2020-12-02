class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission).ongoing
    @campaigns = current_user.campaigns
    @first_mission_done = first_mission_done_achivement?
  end

  def show
    @mission = Mission.find(params[:id])
    @package = @mission.package
    @campaign = @package.campaign
    @first_mission_subscription = first_mission_subscription_achivement?

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

  private

  def first_mission_subscription_achivement?
    if current_user.missions != []
      bolean = current_user.missions.ongoing.count == 1 && current_user.missions.last.recently_created?
    end
    return bolean
  end

  def first_mission_done_achivement?
    if current_user.missions != []
      bolean = current_user.missions.done.count == 1 && current_user.missions.last.recently_done?
    end
    return bolean
  end

end
