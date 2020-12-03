class Campaign < ApplicationRecord
  attr_accessor :material_category

  belongs_to :organisation
  belongs_to :material
  has_many :packages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :missions, through: :packages
  has_one :user, through: :organisation
  has_one_attached :photo

  scope :ongoing, -> { where(status: 'ongoing') }

  UNITS = ['g', 'kg', 'l', 'unité']

  validates :name, presence: true, length: { maximum: 26 }
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :published, presence: true
  validates :target, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, inclusion: { in: UNITS }

  # Utilities

  scope :ongoing, -> { where(status: 'ongoing') }
  scope :done, -> { where(status: 'done') }
  scope :paused, -> { where(status: 'paused') }


  def number_of_days
    (end_date - Date.today).to_i
  end

  def sort_by_step_order
    material.instructions.order(step_order: :asc)
  end

  def members
    missions.map { |mission| mission.user }
  end
end
