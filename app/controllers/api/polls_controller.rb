module Api
  class PollsController < BaseController
    before_filter :load_poll, only: [:show, :previous_id, :next_id ]

    def show
      poll_presenter = PollPresenter.new(@poll)
      previous_poll_id = previous_id
      next_poll_id = next_id

      render json: { chart_data: poll_presenter.piechart_data, prev_id: previous_poll_id, next_id: next_poll_id }
    end

    private

    def load_poll
      @poll = Poll.find(params[:id])
    end

    def previous_id
      return @poll.previous.id unless @poll.previous.nil?
      Poll.last.id
    end

    def next_id
      return @poll.next.id unless @poll.next.nil?
      Poll.first.id
    end
  end
end
