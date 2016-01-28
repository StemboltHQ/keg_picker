class RenameBeerBrandToName < ActiveRecord::Migration
  def change
    rename_column :beers, :brand, :name
  end
end
