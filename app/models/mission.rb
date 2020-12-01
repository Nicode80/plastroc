class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :package

  scope :ongoing, -> { where(status: 'ongoing') }
end
