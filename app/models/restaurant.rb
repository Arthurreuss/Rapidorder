class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :products
  
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
