class TalksController < ApplicationController
  before_action :authenticate_user!, only: [
    :new, :create, :edit, :assign, :unassign, :upvote
  ]

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
    talk = Talk.find(params[:id])
    current_user.upvote(talk)
    redirect_to(talks_path)
  end

  def assign
    talk = Talk.find(params[:id])
    current_user.assign(talk)
    redirect_to(talks_path)
  end

  def unassign
    talk = Talk.find(params[:id])
    current_user.unassign(talk)
    redirect_to(talks_path)
  end

  def search
    @talks = Talk.search(params[:search])
  end

  def roster
    @talks = Talk.where("speak_date = ?", params[:date])
  end

  private

  def talk_params
    params.require(:talk).permit(:topic, :description, :speak_date)
  end
end
