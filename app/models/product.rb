class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :orders, :reviews

  validates :name, :price, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :category, presence: true, inclusion: { in: %w(softdrink beer wine cocktails pizza burgers pasta tapas) }
  validates :type, presence: true, inclusion: { in: %w(drink meal) }
end
