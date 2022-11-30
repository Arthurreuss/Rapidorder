class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  has_many :reviews
  has_many :product_allergies, dependent: :destroy
  has_many :allergies, through: :product_allergies
  has_one_attached :photo

  validates :name, :price, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :category, presence: true, inclusion: { in: %w(Softdrinks Beer Wine Cocktails Pizza Burgers Pasta Tapas) }
  validates :product_type, presence: true, inclusion: { in: %w(Drink Meal) }

end
