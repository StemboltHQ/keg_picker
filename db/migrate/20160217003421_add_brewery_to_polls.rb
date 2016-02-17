class AddBreweryToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :brewery, :string
  end
end
