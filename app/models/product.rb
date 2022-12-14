class Product < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category
  has_many :orders
  has_many :reviews
  has_many :product_allergies, dependent: :destroy
  has_many :allergies, through: :product_allergies
  has_one_attached :photo

  validates :name, :price, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :product_type, presence: true, inclusion: { in: %w[Drink Meal Daily-Menu] }

  def average_rating
    return nil if reviews.empty?
    ((reviews.sum(0.0) { |review| review.rating }) / reviews.size.to_f).round(1)
  end
end
