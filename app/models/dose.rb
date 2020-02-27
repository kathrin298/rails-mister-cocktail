class Dose < ApplicationRecord
  DOSES = ['1cl','2cl','3cl','4cl','5cl','0.5 cup','1 cup','1 oz','1.5 oz','2 oz','1','2','3','4','5','6']
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: [:ingredient] }
end
