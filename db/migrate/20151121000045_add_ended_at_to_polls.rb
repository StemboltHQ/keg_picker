class AddEndedAtToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :ended_at, :datetime
  end
end
