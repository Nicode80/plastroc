class Campaign < ApplicationRecord
  attr_accessor :material_category

  belongs_to :organisation
  belongs_to :material
  has_many :packages
  has_many :missions, through: :packages
  has_one :user, through: :organisation
  has_one_attached :photo

  UNITS = ['g', 'kg', 'l', 'cbm']

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :published, presence: true
  validates :target, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, inclusion: { in: UNITS }


  def number_of_days
    (end_date - Date.today).to_i
  end

  def sort_by_step_order
    material.instructions.order(step_order: :asc)
  end
end
