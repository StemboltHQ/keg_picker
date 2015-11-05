class BallotsController < ApplicationController
  before_action :load_beer, only: [:create]
  before_action :load_ballot, only: [:show]

  def index
    @ballots = Ballot.all
  end

  def new
    @beers = Beer.all
    @ballot = Ballot.new
  end

  def create
    @ballot = @beer.ballots.create!(user_id: current_user.id)
    redirect_to @ballot
  end

  private
  def load_beer
    @beer = Beer.find(params[:beer_id])
  end

  def load_ballot
    @ballot = Ballot.find(params[:id])
  end
end
