class CampaignsController < ApplicationController

  def index # for the moment show all campaigns but will need to sort if on organisation view
    @campaigns = policy_scope(Campaign)
    # @organisations = Organisation.all
    @organisations = organisations_with_active_campaigns
    # raise
    @markers = @organisations.map do |orga|
      {
        lat: orga.latitude,
        lng: orga.longitude
      }
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @packages = @campaign.packages
    @mission = Mission.new
    authorize @campaign
  end

  def new
    @organisation = Organisation.find(params[:organisation_id])
    @campaign = Campaign.new
    @materials = Material.all.select(:id, :name, :category).group_by(&:category)
    authorize @campaign
  end

  def create
    @organisation = Organisation.find(params[:organisation_id])
    @campaign = Campaign.new(campaign_params)
    @campaign.organisation = @organisation

    if @campaign.save
      # => Crétation automatique des packages
      create_packages
      flash[:alert] = 'campagne ajoutée'
      redirect_to campaign_path(@campaign) #redirect to campaign show
    else
      render :new
    end

    authorize @campaign
  end

  def edit
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)
    if @campaign.save
      flash[:notice] = "campagne mise à jour"
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
    authorize @campaign
  end

  def my_campaigns
    @campaigns = current_user.campaigns
    raise
    authorize Campaign
  end

  private

  def organisations_with_active_campaigns
    Organisation.joins(:campaigns).where(campaigns: { 'status' =>  'ongoing'  })

    # Refactored line 71

    # @organisations = []
    # Organisation.all.geocoded.each do |organisation|
    #   ongoing_campaigns = 0
    #   organisation.campaigns.each do |campaign|
    #     if campaign.status == 'ongoing'
    #       ongoing_campaigns += 1
    #     end
    #   end
    #   if ongoing_campaigns.positive?
    #     @organisations << organisation
    #   end
    # end
    # return @organisations
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

  def campaign_params
    params.require(:campaign).permit(
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

  # Refactored line 63

  # def current_user_campaigns
  #   Campaign.all.select do |c|
  #     c.user == current_user
  #   end
  # end
end
