class InstructionsController < ApplicationController
  def new
    @material = Material.find(params[:material_id])
    @instruction = Instruction.new
    authorize @instruction
  end

  def create
    @instruction = Instruction.new(instruction_params)
    @material = Material.find(params[:material_id])
    @instruction.media = params[:media]
    @instruction.material = @material
    if @instruction.save
      redirect_to material_path(@material)
    else
      render :new
    end
    authorize @instruction
  end

  def edit
    @instruction = Instruction.find(params[:id])
    @material = Material.find(@instruction.material_id)
    authorize @instruction
  end

  def update
    @instruction = Instruction.find(params[:id])
    @instruction.material = @material
    if @instruction.update(instruction_params)
      redirect_to material_path(@material)
    else
      render :edit
    end
    authorize @instruction
  end

  def destroy
    @instruction = Instruction.find(params[:id])
    @instruction.media.purge
    @instruction.destroy
    authorize @instruction
    redirect_to material_path(@instruction.material)
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :content, :media, :step_order)
  end
end
