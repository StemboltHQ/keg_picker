class Poll < ActiveRecord::Base
  has_many :ballots
  has_many :users, through: :ballots

  def self.current
    return last unless !any? || last.closed?
      nil
  end
end
