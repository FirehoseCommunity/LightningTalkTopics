class Talk < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :assignee, class_name: 'User'

  scope :unscheduled, -> { where(speak_date: nil).order(:assignee_id).sorted_by_votes.order(:topic) }
  scope :scheduled, -> { where('speak_date >= ?', Date.today).order(:speak_date).order(:topic) }
  scope :previous, -> { where('speak_date < ?', Date.today).order(:topic) }
  scope :sorted_by_votes, -> { order(votes_count: :desc) }

  # Add Validation
  validates :topic, presence: true, length: { minimum: 3 }
  validates :description, presence: true
end
