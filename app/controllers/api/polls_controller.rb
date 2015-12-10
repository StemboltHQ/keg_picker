module Api
  class PollsController < BaseController
    before_filter :load_poll, only: [:show]

    def show
      poll_presenter = PollPresenter.new(@poll)
      if !@poll.previous.nil?
        render json: { chart_data: poll_presenter.piechart_data, prev_id: @poll.previous.id  }
      else
        render json: { chart_data: poll_presenter.piechart_data, prev_id: Poll.last.id }
      end
    end

    private

    def load_poll
      @poll = Poll.find(params[:id])
    end
  end
end
