class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  validates :name, presence: true
end
