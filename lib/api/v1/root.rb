module API
  module V1
    class Root < Grape::API
      mount API::V1::Restaurants
      mount API::V1::MenuItems
    end
  end
end
