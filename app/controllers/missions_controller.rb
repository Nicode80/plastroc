class MissionsController < ApplicationController

  def index
    @missions = policy_scope(Mission).ongoing.first(3)
    @campaigns = current_user.campaigns.first(3)
    @first_mission_done = first_mission_done_achivement?
    @questions = current_user.questions.where(seen: false)
    @top_3 = User.order(xp: :desc).first(3)
  end

  def my_missions
    @ongoing_missions = current_user.missions.ongoing
    @done_missions = current_user.missions.done
    @questions = current_user.questions.where(seen: false)
    authorize Mission
  end

  def show
    @mission = Mission.find(params[:id])
    @package = @mission.package
    @campaign = @package.campaign
    @first_mission_subscription = first_mission_subscription_achivement?
    @question = Question.new
    # calcul of done missions
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
    authorize @mission
    @mission.user = current_user
    @package = Package.find(params[:package_id])
    @mission.package = @package
    if @mission.save!
      if total_missions_calcul >= @mission.campaign.target
        @mission.campaign.update(status: "paused", published: false)
      end
      redirect_to mission_path(@mission)
    else
      redirect_to campaign_path(@package.mission)
    end
  end

  def update
    @mission = Mission.find(params[:id])
    authorize @mission
    @mission.update(status: 'done', completed_at: DateTime.now)
    @user = current_user
    if @user.missions[0] == @mission
      @user.xp += @mission.package.xp_reward + 40
    else
      @user.xp += @mission.package.xp_reward
    end
    @user.save
    redirect_to missions_path
  end

  private

  def total_missions_calcul
    missions = @mission.campaign.missions
    volumes_total = missions.map { |mission| mission.package.quantity }
    return volumes_total.sum
  end

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
