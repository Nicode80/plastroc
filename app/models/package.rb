class Package < ApplicationRecord
  belongs_to :campaign
  has_many :missions

  PACKAGES = ["Hawksbill Turtle", "Amur Leopard", "Black Rhino", "Sumatran Elephant"]

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :xp_reward, presence: true, numericality: { only_integer: true }
end
