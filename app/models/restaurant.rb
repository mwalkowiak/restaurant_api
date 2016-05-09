class Restaurant < ActiveRecord::Base
  validates :name, :description, :rating, :address, presence: true
end
