class BallotsController < ApplicationController
  before_filter :load_beer, only: [:create]
  before_filter :load_ballot, only: [:show, :edit, :update, :destroy]
  before_filter :load_all_beers, only: [:new, :edit]
  authorize_resource

  def index
    @ballots = Ballot.all
  end

  def new
    @ballot = Ballot.new
  end

  def create
    current = Poll.current
    if current
      @ballot = current.ballots.create!(user_id: current_user.id, beer_id: @beer.id)
      redirect_to @ballot
    else
      redirect_to beers_path
    end
  end

  def update
    if @ballot.update(beer_id: params[:beer_id])
      redirect_to @ballot
    end
  end

  def destroy
    @ballot.destroy!
    redirect_to ballots_path
  end

  private
  def load_beer
    @beer = Beer.find(params[:beer_id])
  end

  def load_ballot
    @ballot = Ballot.find(params[:id])
  end

  def load_all_beers
    @beers = Beer.all
  end
end
