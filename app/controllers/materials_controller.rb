class MaterialsController < ApplicationController

  def index
    @materials = policy_scope(Material).all
  end

  def show
    @material = Material.find(params[:id])
    authorize @material
  end

  def new
    @material = Material.new
    authorize @material
  end

  def create
    @material = Material.new(material_params)
    authorize @material
    if @material.save
      redirect_to materials_path
    else
      render :new
    end
  end

  def edit
    @material = Material.find(params[:id])
    authorize @material
  end

  def update
    @material = Material.find(params[:id])
    authorize @material
    @material.update(material_params)
    redirect_to material_path(@material)
  end

  def destroy
    @material = Material.find(params[:id])
    authorize @material
    if @material.instructions == []
      @material.photo.purge
      @material.destroy
      redirect_to materials_path
    else
      redirect_to edit_material_path(@material)
      flash[:notice] = "Vous ne pouvez pas supprimer un matériaux qui a des instructions"
    end
  end

  private

  def material_params
    params.require(:material).permit(:name, :description, :photo, :category)
  end
end
