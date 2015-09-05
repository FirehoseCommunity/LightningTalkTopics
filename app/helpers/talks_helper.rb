module TalksHelper

  def previous_talk
    @talks.where("DATE(speak_date) < ?", Date.today).count
  end

  def upcoming_talk
    @talks.where("DATE(speak_date) >= ?", Date.today).count
  end

end
