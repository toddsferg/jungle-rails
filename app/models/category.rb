class Category < ActiveRecord::Base

  has_many :products
  validates :name, presence: true

end

# adding ability to take information from db using activerecord