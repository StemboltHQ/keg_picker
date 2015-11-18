class Poll < ActiveRecord::Base
  has_many :ballots
  has_many :users, through: :ballots
end
