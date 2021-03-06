class User < ActiveRecord::Base
  include TokenGenerator

  validates :first_name, :last_name, :email, presence: true

  after_create do
    generate_api_token! if api_key.nil?
  end

  def generate_api_token!
    generate_token!(:api_key)
  end
end
