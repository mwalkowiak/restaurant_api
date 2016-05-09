class AddMenuItems < ActiveRecord::Migration
  MENU_ITEMS = [
      {
          :restaurant_id => Restaurant.first.id,
          :name => 'Black Forest Ham and Gouda Boxed Lunch',
          :description => 'With lettuce and tomato on a pretzel roll, boxed with pesto pasta salad, chips, a cookie and condiments on the side',
          :category_id => Category.first.id
      },
      {
          :restaurant_id => Restaurant.first.id,
          :name => 'Italian Salami and Mozzarella Boxed Lunch',
          :description => 'With lettuce and tomato on French baguette, boxed with pesto pasta salad, chips, a cookie and condiments on the side',
          :category_id => Category.first.id.next
      },
      {
          :restaurant_id => Restaurant.first.id,
          :name => 'Oven Roasted Turkey and Farmhouse Cheddar Boxed Lunch',
          :description => 'With lettuce and tomato on brioche, boxed with pesto pasta salad, chips, a cookie and condiments on the side',
          :category_id => Category.first.id.next + 1
      },
      {
          :restaurant_id => Restaurant.first.id.next,
          :name => 'Roast Beef and Provolone Boxed Lunch',
          :description => 'With lettuce and tomato on a pretzel roll, boxed with pesto pasta salad, chips, a cookie and condiments on the side',
          :category_id => Category.first.id.next
      },
      {
          :restaurant_id => Restaurant.first.id.next,
          :name => 'Tomato and Fresh Mozzarella Boxed Lunch',
          :description => 'With basil and balsamic drizzle on ciabbata, boxed with pesto pasta salad, chips, a cookie and condiments on the side',
          :category_id => Category.first.id.next + 1
      },
      {
          :restaurant_id => Restaurant.first.id.next + 1,
          :name => 'Bread Intruder Boxed Lunch',
          :description => 'Corned beef, bacon, hard boiled egg, pepper-jack cheese, jalapenos, smoked cheddar, black pepper, lettuce, & habanero mayo on a rye bagel boxed with chips and a cookie',
          :category_id => Category.first.id
      },
      {
          :restaurant_id => Restaurant.first.id.next + 2,
          :name => 'Chicago Fire Boxed Lunch',
          :description => 'Corned beef, pepper jack, jalapeños & spicy brown mustard on a rye bagel, boxed with chips and a cookie',
          :category_id => Category.first.id.next + 2
      },
      {
          :restaurant_id => Restaurant.first.id,
          :name => 'Crunch & Munch Boxed Lunch',
          :description => 'Turkey, smoked cheddar, lettuce, honey mustard, parmesan, peppercorn dressing & nacho cheese doritos on an everything bagel boxed with chips and a cookie',
          :category_id => Category.first.id
      }
  ]

  def self.up
    MENU_ITEMS.each do |menu_item|
      MenuItem.create(menu_item)
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
