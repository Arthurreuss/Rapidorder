class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :products

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(params[:name, :description, :address])
    @restaurant.save
  end
end
