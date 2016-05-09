class AddRestaurants < ActiveRecord::Migration
  RESTAURANTS = [
      {
          :name => 'Wild Onion Chicago',
          :description => 'Complete Breakfast Buffet. Create your own breakfast buffet with this extensive variety of delicious options',
          :rating => '4.3',
          :address => '806 N Winchester Ave Chicago,IL 60622'
      },
      {
          :name => 'Cassava',
          :description => "Cassava's Signature Gluten-Free Menu. Delicious gluten-free empanadas, perfect for a lunch meeting or an afternoon snack!",
          :rating => '4.1',
          :address => '3338 N Clark St Chicago,Il 60657'
      },
      {
          :name => 'Paramount Events',
          :description => "Paramount Boxed Lunches. An impressive selection of Paramount's finest sandwiches, wraps and salad boxed lunches",
          :rating => '4.8',
          :address => '1932 W Lake Street Chicago,IL 60612'
      },
      {
          :name => 'Chicago Bagel Authority',
          :description => 'Boxed Lunches. Steamed bagel sandwich boxed lunches and combinations',
          :rating => '3.9',
          :address => '11 N. Wells Chicago,IL 60606'
      },
      {
          :name => 'Macello',
          :description => 'A delicious variety of catering pans from Macello. Your choice of salads, appetizers, pasta, meats, and desserts.',
          :rating => '4.5',
          :address => '1235 W Lake St Chicago,Il 60607'
      },
      {
          :name => 'Wildfire',
          :description => 'The sandwich boxed lunches comes with coleslaw, pickle, chips & a cookie. The salad boxed lunches comes with homemade cornbread & a cookie',
          :rating => '4.2',
          :address => '159 W Erie St Chicago,IL 60654'
      }
  ]

  def self.up
    RESTAURANTS.each do |restaurant|
      Restaurant.create(restaurant)
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
