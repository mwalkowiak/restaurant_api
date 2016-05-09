class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer  :restaurant_id, :null => false
      t.string  :name, :null => false
      t.text  :description, :null => false
      t.integer  :category_id, :null => false
      t.timestamps
    end
    add_index :menu_items, :restaurant_id
  end
end
