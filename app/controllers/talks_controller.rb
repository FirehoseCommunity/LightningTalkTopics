class TalksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    current_user.talks.create(talk_params)
    redirect_to root_path
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

  private

  def talk_params
    params.require(:talk).permit(:topic, :description)
  end

end
