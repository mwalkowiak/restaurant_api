class MenuItemTag < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :tag

  validates :menu_item_id, :tag_id, presence: true
  validates_uniqueness_of :tag_id, :scope => :menu_item_id
end