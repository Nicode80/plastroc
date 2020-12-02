class Organisation < ApplicationRecord
  belongs_to :user
  has_many :campaigns
  has_one_attached :photo
  geocoded_by :address

  validates :name, presence: true, length: { maximum: 32 }
  validates :address, presence: true
  validates :opening_hours, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
