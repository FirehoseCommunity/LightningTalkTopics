class TalksController < ApplicationController

  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  private


end
