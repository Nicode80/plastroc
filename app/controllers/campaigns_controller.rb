class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @organisation = Organisation.find(params[:organisation_id])
    @materials = Material.all
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)

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
      :status,
      :published,
      :photo,
      )
  end
end
