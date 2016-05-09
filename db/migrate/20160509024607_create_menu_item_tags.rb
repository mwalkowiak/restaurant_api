class CreateMenuItemTags < ActiveRecord::Migration
  def change
    create_table :menu_item_tags do |t|
      t.integer :menu_item_id, :null => false
      t.integer :tag_id, :null => false
      t.timestamps
    end
    add_index :menu_item_tags, [:menu_item_id, :tag_id]
  end
end
