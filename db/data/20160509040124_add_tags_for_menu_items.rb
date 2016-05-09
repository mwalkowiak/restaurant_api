class AddTagsForMenuItems < ActiveRecord::Migration
  MENU_ITEM_TAGS = [
      {
          :menu_item_id => MenuItem.first.id,
          :tag_id => Tag.first.id
      },
      {
          :menu_item_id => MenuItem.first.id,
          :tag_id => Tag.first.id.next
      },
      {
          :menu_item_id => MenuItem.first.id,
          :tag_id => Tag.first.id.next + 1
      },
      {
          :menu_item_id => MenuItem.first.id.next,
          :tag_id => Tag.first.id
      },
      {
          :menu_item_id => MenuItem.first.id.next,
          :tag_id => Tag.first.id.next
      },
      {
          :menu_item_id => MenuItem.first.id.next,
          :tag_id => Tag.first.id.next + 2
      },
      {
          :menu_item_id => MenuItem.last.id,
          :tag_id => Tag.first.id.next
      },
      {
          :menu_item_id => MenuItem.last.id - 1,
          :tag_id => Tag.first.id.next + 1
      },
      {
          :menu_item_id => MenuItem.last.id - 1,
          :tag_id => Tag.first.id
      },
  ]

  def self.up
    MENU_ITEM_TAGS.each do |mit|
      MenuItemTag.create(mit)
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
