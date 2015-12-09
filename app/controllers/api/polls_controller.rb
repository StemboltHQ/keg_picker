module Api
  class PollsController < BaseController
    before_filter :load_poll, only: [:show]

    private

    def load_poll
      @poll = Poll.find(params[:id])
    end
  end
end
