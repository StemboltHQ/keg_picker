class BeersController < ApplicationController

  def new
    @beer = Beer.new
  end

end
