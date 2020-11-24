class OrganisationsController < ApplicationController

  def new
    @organisation = Organisation.new
    authorize @organisation
  end

  def create

  end
end
