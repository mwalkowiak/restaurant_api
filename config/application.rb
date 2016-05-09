require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Pagination config
WillPaginate.per_page = 3

module FoodaApi
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.paths.add "lib/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/lib/api/*"]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
