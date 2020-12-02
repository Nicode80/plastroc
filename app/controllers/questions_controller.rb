class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @campaign = Campaign.find(params[:campaign_id])
    @question.campaign = @campaign
    if @question.save
      flash[:alert] = 'question ajoutée'
      if @campaign.members.include?(current_user)
        @mission = current_user.missions.joins(:package).where(packages: { campaign_id: @campaign.id })[0]
        redirect_to mission_path(@mission, anchor: "question_title") #redirect to mission show
      else
        redirect_to campaign_path(@campaign, anchor: "question_title") #redirect to campaign show
      end
    else
      flash[:alert] = "la question n'a pas été ajoutée, réessayez"
      if @campaign.members.include?(current_user)
        @mission = current_user.missions.joins(:package).where(packages: { campaign_id: @campaign.id })[0]
        redirect_to mission_path(@mission) #redirect to mission show
      else
        redirect_to campaign_path(@campaign) #redirect to campaign show
      end
    end
    authorize @question
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    @question.seen = false
    if @question.save
      flash[:notice] = "la question a été vite répondue 😂"
      redirect_to dashboard_campaign_path(@question.campaign, anchor: "question_title")
    else
      flash[:notice] = "désolé, la réponse n'a pas pu être ajoutée"
      redirect_to dashboard_campaign_path(@question.campaign, anchor: "question_title")
    end
    authorize @question
  end

  def seen
    @question = Question.find(params[:id])
    @question.seen = true
    @question.save
    if @question.campaign.members.include?(current_user)
      @mission = current_user.missions.joins(:package).where(packages: { campaign_id: @question.campaign.id })[0]
      redirect_to mission_path(@mission) #redirect to mission show
    else
      redirect_to campaign_path(@question.campaign) #redirect to campaign show
    end
    authorize @question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to dashboard_campaign_path(@question.campaign, anchor: "question_title")
    authorize @question
  end

  private

  def question_params
    params.require(:question).permit(
      :title,
      :content,
      :answer)
  end
end
