class PagesController < ApplicationController
  def home
    @poll = Poll.ongoing.last
  end
end
