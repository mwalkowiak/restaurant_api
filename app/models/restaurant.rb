class Restaurant < ActiveRecord::Base
  validates :name, :description, :rating, :address, presence: true

  has_many :menu_items
end
