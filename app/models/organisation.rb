class Organisation < ApplicationRecord
  belongs_to :user
  has_many :campaigns
  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true
  validates :opening_hours, presence: true
end
