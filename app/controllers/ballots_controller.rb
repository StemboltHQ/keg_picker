class BallotsController < ApplicationController
  before_filter :load_beer, only: [:create]
  before_filter :load_ballot, only: [:show, :edit, :update, :destroy]
  before_filter :load_all_beers, only: [:new, :edit, :create]
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
      @ballot = current.ballots.new(user_id: current_user.id, beer_id: @beer.id)
      if @ballot.save
        flash[:success] = "You have successfully voted for #{ @beer.name }"
        redirect_to ballots_path
      else
        flash[:danger] = "Could not create a new vote for you :( "
        render :new
      end
    end
  end

  def update
    if @ballot.update(beer_id: params[:beer_id])
      flash[:success] = "You have changed your vote to #{ @ballot.beer.name }"
      redirect_to ballots_path
    end
  end

  def destroy
    @ballot.destroy!
    flash[:warning] = "Your vote was deleted.. Vote again?"
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
