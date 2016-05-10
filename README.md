# Restaurant/Menu Item API
API for restaurants and menu items

In order to run the project:

  Clone the repo:
  ```sh
  git clone git@github.com:mwalkowiak/restaurant_api.git
  ```
  ```
  cd restaurant_api
  ```
  ```
  bundle install
  ```
  Run database schema and data migrations to populate the data
  ```
  rake db:migrate data:migrate
  ```
  run server:
  ```
  rails server
  ```
  In order to check and run tests please type:
  ```
  bundle exec rspec
  ```

## API requests

Please use ``VzHxH9SBiF157U_zvoED7FH3_XeGG1C5`` as API key
This is the only fixed api key, the rest of those keys is being generated dynamically during data migration as well as any other creation of the new user (please see after_create callback in user model)

### Get restaurants list:
```
curl --request GET 'http://localhost:3000/api/v1/restaurants?token=VzHxH9SBiF157U_zvoED7FH3_XeGG1C5'
```

### Get restaurants list with pagination support (page size is 2):
```
curl --request GET 'http://localhost:3000/api/v1/restaurants?token=VzHxH9SBiF157U_zvoED7FH3_XeGG1C5&page=2'
```

### Get menu items list for given restaurant_id:
```
curl --request GET 'http://localhost:3000/api/v1/menu_items/2?token=VzHxH9SBiF157U_zvoED7FH3_XeGG1C5'
```

### Get menu items list for given restaurant_id with pagination support (page size is 2):
```
curl --request GET 'http://localhost:3000/api/v1/menu_items/1?token=VzHxH9SBiF157U_zvoED7FH3_XeGG1C5&page=2'
```
* API requests are returnining 401 (Unauthorized) for non valid API Key
* By valid API Key we understand any 32 char long guid key in db assigned to any user
* We are returning 404 for menu_items API call if `restaurant(id)` does not exist in `restaurants` table
* We are returning empty array if there is no menu items for given `restaurant_id` which exists in `restaurants` table
