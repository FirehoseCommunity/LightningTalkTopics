class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :talks, dependent: :destroy
  has_many :votes

  def upvote(talk)
    votes.create(talk: talk) unless voted?(talk)
  end

  def voted?(talk)
    votes.where(talk: talk).any?
  end
end
