class Allergy < ApplicationRecord
  has_many :product_allergies
  has_many :products, through: :product_allergies
end
