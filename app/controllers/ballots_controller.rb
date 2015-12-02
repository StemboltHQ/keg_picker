class BallotsController < ApplicationController
  before_action :load_beer, only: [:create]

  def new
    @beers = Beer.all
    @ballot = Ballot.new
  end

  def create
    @ballot = @beer.ballots.create!(user_id: current_user.id)
    redirect_to beers_path
  end

  private
  def load_beer
    @beer = Beer.find(params[:beer_id])
  end
end
