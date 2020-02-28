class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
  validates :name, uniqueness: true, presence: true
  validate :check_file_presence

  def check_file_presence
    errors.add(:photo, "no photo added") unless photo.attached?
  end
end
