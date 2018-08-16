class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates_presence_of :description, :cocktail, :ingredient
  validates :cocktail, uniqueness: { scope: :ingredient }
end
