class Instruction < ApplicationRecord
  belongs_to :material
  has_one_attached :media
  has_rich_text :rich_content

  validates :title, presence: true
  # validates :rich_content, presence: true
  validates :step_order, presence: true
end
