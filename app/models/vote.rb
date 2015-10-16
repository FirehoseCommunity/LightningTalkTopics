class Vote < ActiveRecord::Base
  belongs_to :talk, counter_cache: true
  belongs_to :user
end
