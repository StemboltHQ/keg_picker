class BeersController < ApplicationController
  before_action :load_beer, only: [:show]

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.save!
    redirect_to @beer
  end

  private
  def beer_params
    params.require(:beer).permit(:brand)
  end

  def load_beer
    @beer = Beer.find(params[:id])
  end
end
