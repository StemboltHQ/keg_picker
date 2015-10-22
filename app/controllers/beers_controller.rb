class BeersController < ApplicationController

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

end
