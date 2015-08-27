class TalksController < ApplicationController

  def index
    @talks = Talk.all
  end

end
