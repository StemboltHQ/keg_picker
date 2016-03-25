class AddBreweryToBeers < ActiveRecord::Migration
  def change
    add_reference :beers, :brewery, index: true, foreign_key: true
  end
end
