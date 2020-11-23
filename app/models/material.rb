class Material < ApplicationRecord
  has_many :instructions
  has_many :campaigns
  has_one_attached :photo

  validates :name, presence: true
end
