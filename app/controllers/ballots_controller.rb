class BallotsController < ApplicationController
  before_action :load_beer, only: [:create]
  before_action :load_ballot, only: [:show, :edit, :update]
  before_action :load_all_beers, only: [:new, :edit]

  def index
    @ballots = Ballot.all
  end

  def new
    @ballot = Ballot.new
  end

  def create
    @ballot = @beer.ballots.create!(user_id: current_user.id)
    redirect_to @ballot
  end

  def update
    if @ballot.update(beer_id: params[:beer_id])
      redirect_to @ballot
    end
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
