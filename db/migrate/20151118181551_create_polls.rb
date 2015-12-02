class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.boolean :closed, default: false

      t.timestamps null: false
    end
  end
end
