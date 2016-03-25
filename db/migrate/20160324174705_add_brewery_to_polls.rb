class AddBreweryToPolls < ActiveRecord::Migration
  def change
    add_reference :polls, :brewery, index: true, foreign_key: true
  end
end
