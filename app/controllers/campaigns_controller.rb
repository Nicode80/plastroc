class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @organization = Organization.find(params[:id])
    authorize @campaign
  end

  def create
    @campaign = Campaign
  end
end
