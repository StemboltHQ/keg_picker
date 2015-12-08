class Poll < ActiveRecord::Base
  has_many :ballots
  has_many :users, through: :ballots
  belongs_to :winner, class_name: "Beer"

  def self.current
    return last unless !any? || last.closed?
      nil
  end

  def finalize
    if self.ballots.any?
      find_winner
      lock
    end
  end

  def find_winner
    self.update(winner: ballots.reverse_order.group(:beer).count.first[0])
  end

  def lock
    self.update(closed: true)
  end

  def next
    Poll.where("id > ?", id).first
  end

  def previous
    Poll.where("id < ?", id).last
  end
end
