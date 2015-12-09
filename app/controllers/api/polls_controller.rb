module Api
  class PollsController < BaseController
    before_filter :load_poll, only: [:show]

    def show
      poll_presenter = PollPresenter.new(@poll)
      render json: poll_presenter.piechart_data
    end

    private

    def load_poll
      @poll = Poll.find(params[:id])
    end
  end
end
