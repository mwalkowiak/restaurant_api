class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string  :name, :null => false
      t.text  :description, :null => false
      t.decimal  :rating, :precision => 2, :scale => 1, :null => false
      t.string  :address, :null => false
      t.timestamps
    end
  end
end
