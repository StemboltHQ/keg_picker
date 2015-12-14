class PollsController < ApplicationController
  before_filter :load_poll, only: [:destroy, :update]
  authorize_resource

  def index
    @polls = Poll.all
  end

  def create
    Poll.create!
    flash[:success] = "You have opened a new Poll"
    redirect_to beers_path
  end

  def finalize
    poll = Poll.find(params[:poll_id])
    poll.finalize
    redirect_to polls_path
  end

  def update
    if @poll.update!(update_params)
      flash[:success] = "The Poll has been updated!"
      redirect_to polls_path
    end
  end

  def destroy
    @poll.destroy!
    flash[:success] = "The Poll was deleted.."
    redirect_to polls_path
  end

  private

  def load_poll
    @poll = Poll.find(params[:id])
  end

  def update_params
    params.permit(:closed, :ended_at)
  end
end
