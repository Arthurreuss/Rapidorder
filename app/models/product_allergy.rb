class ProductAllergy < ApplicationRecord
  belongs_to :product
  belongs_to :allergy
end
