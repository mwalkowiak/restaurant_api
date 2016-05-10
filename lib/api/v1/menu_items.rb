# lib/api/v1/menu_items.rb
module API
  module V1
    class MenuItems < Grape::API
      version 'v1'
      format :json

      resource :menu_items do
        desc 'Retrieve restaurants menu items'

        params do
          requires :restaurant_id, type: Integer, desc: 'Restaurant id'
        end
        route_param :restaurant_id do
          get do
            results = []

            # Avoid N+1 query problem using includes
            menu_items = MenuItem.with_restaurant_id(params[:restaurant_id]).includes(:tags, :category).page(params[:page])

            # We search against Restaurant table, because we want differentiate non existing restaurant
            # and menu items for given restaurant which might be not created yet then we will just return empty array
            error!('record not found', 404) unless Restaurant.find_by(id: params[:restaurant_id])

            menu_items.each do |menu_item|
              data_records = [
                  menu_item.as_json,
                  { :tags => menu_item.tags.map {|tag| tag.name} },
                  { :category => menu_item.category_name }
              ]

              # combine all needed key values for final hash here
              results << data_records.inject(&:merge)
            end

            status 200
            results
          end
        end
      end

    end
  end
end