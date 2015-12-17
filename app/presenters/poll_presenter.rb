require 'delegate'

class PollPresenter < SimpleDelegator
  def initialize(poll)
    @poll = poll
  end

  def number_of_votes
    "Total number of votes: #{ @poll.ballots.count }"
  end

  def piechart_data
    @poll.ballots.joins(:beer).group('beers.brand').count
  end

end
