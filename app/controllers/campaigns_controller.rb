class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @organisation = Organisation.find(params[:organisation_id])
    @materials = Material.all
    authorize @campaign
  end

  def create
    @campaign = Campaign
  end
end
