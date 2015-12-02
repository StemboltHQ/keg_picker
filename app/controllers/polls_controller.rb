class PollsController < ApplicationController
  before_filter :load_poll, only: [:destroy]
  authorize_resource

  def index
    @polls = Poll.all
  end

  def create
    Poll.create!
    redirect_to beers_path
  end

  def destroy
    @poll.destroy!
    redirect_to polls_path
  end

  private

  def load_poll
    @poll = Poll.find(params[:id])
  end
end
