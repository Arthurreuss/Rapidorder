class Category < ApplicationRecord
  has_many :products
  belongs_to :restaurant
  has_one_attached :photo
  validates :product_type, presence: true, inclusion: { in: %w[Drink Meal] }
  validates :name, presence: true
end
