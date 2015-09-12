class TalksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :assigned]

  def index
    @unscheduled_talks = Talk.unscheduled
    @scheduled_talks = Talk.scheduled
    @previous_talks = Talk.previous
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = current_user.talks.create(talk_params)
    if @talk.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    @talk.update_attributes(talk_params)
    redirect_to root_path
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to root_path
  end

  def upvote
    @talk = Talk.find(params[:id])
    @talk.votes.create
    redirect_to(talks_path)
  end

  def assigned
    @talk = Talk.find(params[:id])
    user = "#{current_user.first_name} #{current_user.last_name.first}"
    if @talk.is_assigned == false
      @talk.update_attributes(is_assigned: true, assigned_to: user)
    else
      @talk.update_attributes(is_assigned: false, assigned_to: nil)
    end
    redirect_to(talks_path)
  end

  private

  def talk_params
    params.require(:talk).permit(:topic, :description, :speak_date)
  end

end
