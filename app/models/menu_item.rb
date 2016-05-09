class MenuItem < ActiveRecord::Base
  validates :restaurant_id, :name, :description, :category_id, presence: true

  has_many :menu_item_tags
  has_many :tags, through: :menu_item_tags

  belongs_to :category

  self.per_page = 2

  def category_name
    @category_name ||= category.name if category
  end

  def self.with_restaurant_id(restaurant_id)
    where(restaurant_id: restaurant_id)
  end
end
