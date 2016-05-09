# lib/api/root.rb

module API
  class Root < Grape::API
    prefix 'api'

    before do
      error!('401 Unauthorized', 401) unless authenticated
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!({ error: 'Bad Request', errors: e.full_messages }, 400)
    end

    helpers do
      def authenticated
        valid_token?(params[:token]) && User.find_by(:api_key => params[:token])
      end

      def valid_token?(token)
        token && token.length.eql?(32)
      end
    end

    mount API::V1::Root
  end
end
