class OrganisationsController < ApplicationController

  def index
    @organisations = policy_scope(Organisation)
  end

  def new
    @organisation = Organisation.new
    authorize @organisation
  end

  def create
    @organisation = current_user.organisations.new(organisation_params)
    if @organisation.save
      flash[:notice] = "Organisation created"
      redirect_to organisations_path
    else
      render :new
    end
    authorize @organisation
  end

  def edit
    @organisation = Organisation.find(params[:id])
    authorize @organisation
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    if @organisation.save
      flash[:notice] = "Organisation updated"
      redirect_to organisations_path
    else
      render :new
    end
    authorize @organisation
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    flash[:notice] = "Organisation deleted"
    redirect_to organisations_path
    authorize @organisation
  end

  private

  def organisation_params
    params.require(:organisation).permit(
      :name,
      :address,
      :city,
      :postcode,
      :about,
      :opening_hours,
      :contact,
      :photo)
  end
end
