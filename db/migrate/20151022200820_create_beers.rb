class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brand

      t.timestamps null: false
    end
  end
end
