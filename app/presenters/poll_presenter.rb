require 'delegate'

class PollPresenter < SimpleDelegator
  def initialize(poll)
    @poll = poll
  end

  def piechart_data
    @poll.ballots.joins(:beer).group('beers.brand').count
  end
end
