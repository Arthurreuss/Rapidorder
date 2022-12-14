class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :tables, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
