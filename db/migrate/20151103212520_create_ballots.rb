class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.references :user, index: true, foreign_key: true
      t.references :beer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
