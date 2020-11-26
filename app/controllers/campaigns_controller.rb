class CampaignsController < ApplicationController

  def index # for the moment show all campaigns but will need to sort if on organisation view
    @campaigns = policy_scope(Campaign)
  end

  def show
    @campaign = Campaign.find(params[:id])
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
      flash[:alert] = 'campagne ajoutée'
      redirect_to campaign_path(@campaign) #redirect to campaign show
    else
      render :new
    end

    authorize @campaign
  end

  def my_campaigns
    @campaigns = current_user_campaigns
    authorize Campaign
  end

  private

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

  def current_user_campaigns
    Campaign.all.select do |c|
      c.user == current_user
    end
  end
end
