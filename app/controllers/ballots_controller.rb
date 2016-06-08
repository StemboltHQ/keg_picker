class BallotsController < ApplicationController
  before_filter :load_beer, only: [:create]
  before_filter :load_ballot, only: [:edit, :update, :destroy]
  before_filter :load_all_beers, only: [:new, :edit, :create]
  before_action :authenticate_user!, only: :new
  authorize_resource

  def new
    if Poll.current
      @ballot = Ballot.new
    else
      flash[:warning] = "There is no open poll to vote in currently!"
      redirect_to :back
    end
  end

  def create
    current = Poll.current
    if current
      @ballot = current.ballots.new(user_id: current_user.id, beer: @beer)
      if @ballot.save
        flash[:success] = "You have successfully voted for #{ @beer.name }"
        redirect_to root_path
      else
        flash[:danger] = "Could not create a new vote for you :( "
        render :new
      end
    else
      flash[:danger] = "There is no poll currently ongoing. Come back later :)"
      redirect_to polls_path
    end
  end

  def update
    if @ballot.update(beer_id: params[:beer_id])
      flash[:success] = "You have changed your vote to #{ @ballot.beer.name }"
      redirect_to root_path
    end
  end

  def destroy
    @ballot.destroy!
    flash[:warning] = "Your vote was deleted.. Vote again?"
    redirect_to root_path
  end

  private

  def load_beer
    @beer = Beer.find(params[:beer_id])
  end

  def load_ballot
    @ballot = Ballot.find(params[:id])
  end

  def load_all_beers
    @beers =
      if brewery = Poll.current.try(:brewery)
        Beer.where(brewery: brewery)
      else
        Beer.all
      end
  end
end
