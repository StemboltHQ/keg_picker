class PollsController < ApplicationController

  def create
    Poll.create!
    redirect_to beers_path
  end
end
