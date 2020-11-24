class Instruction < ApplicationRecord
  belongs_to :material
  has_one_attached :media

  validates :title, presence: true
  validates :content, presence: true
  validates :step_order, presence: true
end
