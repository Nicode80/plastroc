class Question < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
