class InstructionsController < ApplicationController
  def new
    @material = Material.find(params[:material_id])
    @instruction = Instruction.new
    authorize @instruction
  end

  def create
    @instruction = Instruction.new(instruction_params)
    authorize @instruction
    @material = Material.find(params[:material_id])
    @instruction.rich_content = params[:instruction][:rich_content]
    @instruction.material = @material
    if @instruction.save
      redirect_to material_path(@material)
    else
      render :new
    end
  end

  def edit
    @instruction = Instruction.find(params[:id])
    authorize @instruction
  end

  def update
    @instruction = Instruction.find(params[:id])
    authorize @instruction
    @material = Material.find(@instruction.material_id)
    @instruction.rich_content = params[:instruction][:rich_content]
    @instruction.material = @material
    if @instruction.update(instruction_params)
      redirect_to material_path(@material)
    else
      render :edit
    end
  end

  def destroy
    @instruction = Instruction.find(params[:id])
    authorize @instruction
    @instruction.media.purge
    @instruction.destroy
    redirect_to material_path(@instruction.material)
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :rich_body, :media, :step_order)
  end
end
