class Material < ApplicationRecord
  has_many :instructions
  has_many :campaigns
  has_one_attached :photo

  CATEGORIES = ['paper', 'metal', 'plastic', 'wood', 'organic', 'fabric']

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
