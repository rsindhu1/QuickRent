class AddPriceToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :price, :float,default: false
  end
end
