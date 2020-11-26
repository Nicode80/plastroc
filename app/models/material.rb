class Material < ApplicationRecord
  has_many :instructions
  has_many :campaigns
  has_one_attached :photo

  CATEGORIES = ['Papier', 'Métal', 'Plastique', 'Bois', 'Composte', 'Tissu']

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
