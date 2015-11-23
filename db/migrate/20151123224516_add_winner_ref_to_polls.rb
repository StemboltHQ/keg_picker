class AddWinnerRefToPolls < ActiveRecord::Migration
  def change
    add_reference :polls, :winner, index: true, foreign_key: true
  end
end
