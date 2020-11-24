class OrganisationsController < ApplicationController

  def index
    @organisations = policy_scope(Organisation)
  end

  def new
    @organisation = Organisation.new
    authorize @organisation
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user
    if @organisation.save!
      redirect_to organisations_path
    else
      render :new
    end
    authorize @organisation
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :address, :city, :postcode, :about, :opening_hours, :contact, :photo)
  end
end
