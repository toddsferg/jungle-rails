class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user
  validates :rating, numericality: true
  validates :description, length: {minimum: 1, maximum: 255}
end
