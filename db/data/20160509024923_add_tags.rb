class AddTags < ActiveRecord::Migration
  TAGS = [
      'vegan',
      'kosher',
      'gluten-free',
      'dairy-free',
      'raw'
  ]

  def self.up
    TAGS.each do |tag|
      Tag.create(name: tag)
    end
  end

  def self.down
    TAGS.each do |tag|
      Tag.find_by(name: tag).delete
    end
  end
end
