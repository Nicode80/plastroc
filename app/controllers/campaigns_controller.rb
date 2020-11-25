class CampaignsController < ApplicationController

  def index # for the moment show all campaigns but will need to sort if on organisation view
    @campaigns = policy_scope(Campaign)
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
      flash[:alert] = 'campaign created'
      redirect_to organisations_path
    else
      render :new
    end
    authorize @campaign
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
end
