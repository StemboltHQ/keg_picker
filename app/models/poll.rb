class Poll < ActiveRecord::Base
  has_many :ballots
  has_many :users, through: :ballots
  belongs_to :winner, class_name: "Beer"
  belongs_to :brewery

  scope :ongoing, -> { where(closed: false) }

  def self.current
    return last unless !any? || last.closed?
    nil
  end

  def open?
    !closed
  end

  def finalize
    if self.ballots.any?
      pick_winner!
      close!
    end
  end

  def next
    Poll.where("id > ?", id).first
  end

  def previous
    Poll.where("id < ?", id).last
  end

  private

  def pick_winner!
    winning_beer_id = ballots.
      select("beer_id, COUNT(id) AS ballot_count").
      group(:beer_id).
      order("ballot_count DESC").
      first.
      beer_id
    update(winner_id: winning_beer_id, ended_at: Time.now)
  end

  def close!
    update(closed: true)
  end
end
