class AddCategoriesForMenuItems < ActiveRecord::Migration
  CATEGORIES = [
      'Entree',
      'Appetizer',
      'Dessert',
      'Beverage',
      'Side'
  ]

  def self.up
    CATEGORIES.each do |category|
      Category.create(name: category)
    end
  end

  def self.down
    CATEGORIES.each do |category|
      Category.find_by(name: category).delete
    end
  end
end
