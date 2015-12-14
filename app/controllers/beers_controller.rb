class BeersController < ApplicationController
  authorize_resource
  before_action :load_beer, only: [:edit, :show, :destroy, :update]

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      flash[:success] = "You have successfully voted for #{ @beer.brand }"
      redirect_to @beer
    else
      flash[:danger] = "Could not add a new Beer :( Try again!"
      render :new
    end
  end

  def update
    if @beer.update(beer_params)
      flash[:success] = "You have successfully changed your Beer!"
      redirect_to @beer
    else
      render :edit
      flash[:danger] = "Oops something went wrong.."
    end
  end

  def destroy
    @beer.destroy!
    flash[:success] = "The Beer was removed from the list"
    redirect_to beers_path
  end

  private
  def beer_params
    params.require(:beer).permit(:brand)
  end

  def load_beer
    @beer = Beer.find(params[:id])
  end
end
