class Talk < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  belongs_to :user

  scope :unscheduled, -> { where(speak_date: nil).order(:topic) }
  scope :scheduled, -> { where('speak_date >= ?', Date.today).order(:speak_date).order(:topic) }
  scope :previous, -> { where('speak_date < ?', Date.today).order(:topic) }

  # Add Validation
  validates :topic, presence: true, length: { minimum: 3 }
  validates :description, presence: true
end
