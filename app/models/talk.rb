class Talk < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  belongs_to :user

  scope :unscheduled, -> { where(speak_date: nil).order(:topic) }
  scope :scheduled, -> { where('speak_date >= ?', Date.today).order(:topic) }
  scope :previous, -> { where('speak_date < ?', Date.today).order(:topic) }
end
