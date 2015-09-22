class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :talks, dependent: :destroy
  has_many :votes
  has_many :assigned_talks, class_name: 'Talk', foreign_key: 'assignee_id'

  def upvote(talk)
    votes.create(talk: talk) unless voted?(talk)
  end

  def voted?(talk)
    votes.where(talk: talk).any?
  end

  def assign(talk)
    talk.update(assignee: self)
  end

  def unassign(talk)
    talk.update(assignee: nil) if talk.assignee == self
  end
end
