class AddPollRefToBallots < ActiveRecord::Migration
  def change
    add_reference :ballots, :poll, index: true, foreign_key: true
  end
end
