class Instruction < ApplicationRecord
  belongs_to :material
  has_one_attached :media

  validates :name, presence: true
  validates :content, presence: true
  validates :step_order, presence: true
end
