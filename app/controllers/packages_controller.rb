class PackagesController < ApplicationController

  def create
    @package = package.new(package_params)
    @campaign = Campaign.find(params[:campaign_id])
    @package.campaign = @campaign
    @package.save
  end

  private

  def package_params
    params.require(:package).permit(
      :name,
      :quantity,
      :xp_quantity)
  end
end
