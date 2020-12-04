class CampaignsController < ApplicationController

  def index # for the moment show all campaigns but will need to sort if on organisation view
    @categories = active_materials_categories
    if params[:category] && params[:category].keys.any?
    # if params[:category_filter]&.split(',')&.any?  params[:category_filter].split(',')
      @campaigns = policy_scope(Campaign).where(status: 'ongoing').includes(:material).where(materials: { category: params[:category].keys })
      @organisations = @campaigns.map { |campaign| campaign.organisation }
      @markers = create_markers(@organisations)
      # redirect_to campaigns_path
    else
      @campaigns = policy_scope(Campaign).where(status: 'ongoing')
      @organisations = organisations_with_active_campaigns
      @markers = create_markers(@organisations)
    end
    # respond_to do |format|
    #   format.html
    #   format.json { @campaings.to_json }
    # end
  end

  def my_campaigns
    @ongoing_campaigns = current_user.campaigns.ongoing
    @done_campaigns = current_user.campaigns.done
    @paused_campaigns = current_user.campaigns.paused
    @questions = current_user.questions.where(seen: false)
    authorize Campaign
  end

  def show
    @campaign = Campaign.find(params[:id])
    @packages = @campaign.packages
    @mission = Mission.new
    @question = Question.new
    @volume_done = done_missions_calcul
    @ratio = @volume_done.fdiv(@campaign.target) * 100 # used in dataset for animated bar
    @citation = Citation.all.sample
    @sorter_campaigns = current_user.missions.ongoing.map { |mission| mission.package.campaign }
    authorize @campaign
  end

  def new
    @campaign = Campaign.new
    @materials = Material.all.select(:id, :name, :category).group_by(&:category)
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    authorize @campaign
    @campaign.published = true
    @campaign.status = "ongoing"
    if @campaign.save
      # => Crétation automatique des packages
      create_packages
      flash[:alert] = 'campagne ajoutée'
      redirect_to dashboard_campaign_path(@campaign) #redirect to campaign show
    else
      render :new
    end
  end

  def duplicate
    campaign_to_dupilcate = Campaign.find(params[:id])
    @campaign = campaign_to_dupilcate.dup
    authorize @campaign
    @campaign.start_date = Date.today
    @campaign.end_date = Date.today + 10
    @campaign.published = true
    @campaign.status = "ongoing"
    @campaign.save
    # => Crétation automatique des packages
    create_packages
    flash[:alert] = 'campagne dupliquée'
    redirect_to edit_campaign_path(@campaign) #redirect to edit
  end

  def edit
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)
    authorize @campaign
    if @campaign.save
      flash[:notice] = "campagne mise à jour"
      redirect_to dashboard_campaign_path(@campaign)
    else
      render :edit
    end
  end


  def dashboard
    @campaign = Campaign.find(params[:id])
    @ongoing_missions = @campaign.missions.ongoing
    @volume_done = done_missions_calcul
    @volume_total = total_missions_calcul
    @ratio_done = @volume_done.fdiv(@campaign.target) * 100 # used in dataset for animated bar
    @ratio_engaged = @volume_total.fdiv(@campaign.target) * 100 # used in dataset for animated bar
    authorize @campaign
  end

  def pause
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.published = false
    @campaign.status = "paused"
    @campaign.save
    flash[:notice] = "campagne en pause"
    redirect_to dashboard_campaign_path(@campaign)
  end

  def finish
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.update(status: "done")
    flash[:notice] = "campagne terminée"
    redirect_to my_campaigns_campaigns_path
  end


  def publish
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    if total_missions_calcul >= @campaign.target
      flash[:notice] = "Vous ne pouvez pas publier sans changer la quantité total"
    else
      @campaign.published = true
      @campaign.status = "ongoing"
      flash[:notice] = "campagne publiée"
    end
    @campaign.save
    redirect_to dashboard_campaign_path(@campaign)
  end

  private

  def active_materials_categories
    categories = []
    Material.all.each do |material|
      if !material.campaigns.empty?
        categories << material.category
      end
    end
    return categories.uniq
  end

  def organisations_with_active_campaigns
    Organisation.joins(:campaigns).where(campaigns: { status: 'ongoing' })
  end

  def number_of_active_campaign(organisation)
    Campaign.where(organisation: organisation).where(status: 'ongoing').count
  end

  def active_campaigns(organisation)
    Campaign.where(organisation: organisation).where(status: 'ongoing')
  end

  def create_packages
    iterators = [(@campaign.target / @campaign.min_package).floor, 4].min
    names = ['Corail', 'Tortue', 'Dauphin', 'Baleine']
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign.min_package
      @reward = (x + 1) * @campaign.min_package / 2
      @campaign.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end
  end

  def done_missions_calcul
    missions = @campaign.missions
    volumes_done = missions.done.map { |mission| mission.package.quantity }
    return volumes_done.sum
  end

  def total_missions_calcul
    missions = @campaign.missions
    volumes_total = missions.map { |mission| mission.package.quantity }
    return volumes_total.sum
  end

  def create_markers(organisations)
    @organisations.map do |organisation|
      @organistion_active_campaigns = active_campaigns(organisation)
      url = organisation.photo.attached? ? url_for(organisation.photo) : helpers.asset_url('placeholder.png')
      {
        campaigns_number: number_of_active_campaign(organisation),
        lat: organisation.latitude,
        lng: organisation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { organisation: organisation }),
        image_url: url,
        id: organisation.id
      }
    end
  end

  def campaign_params
    params.require(:campaign).permit(
      :organisation_id,
      :name,
      :description,
      :start_date,
      :end_date,
      :target,
      :unit,
      :photo,
      :material_id,
      :status,
      :min_package,
      :published)
  end
end
