# lib/api/v1/restaurants.rb
module API
  module V1
    class Restaurants < Grape::API
      version 'v1'
      format :json

      resource :restaurants do
        desc 'Return list of restaurants'

        get do
          status 200
          Restaurant.all.page(params[:page])
        end
      end
    end
  end
end