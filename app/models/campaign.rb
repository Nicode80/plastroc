class Campaign < ApplicationRecord
  belongs_to :organisation
  belongs_to :material
  has_many :packages
  has_many :missions, through: :packages
  has_one_attached :photo

  UNITS = ['g', 'kg', 'l', 'cbm']

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :published, presence: true
  validates :target, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, inclusion: { in: UNITS }

end
