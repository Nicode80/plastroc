class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :missions
  has_many :packages, through: :missions
  has_many :organisations
  has_many :campaigns, through: :organisations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :xp, numericality: { only_integer: true }
end
