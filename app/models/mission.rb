class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :package
  has_one :campaign, through: :package

  scope :ongoing, -> { where(status: 'ongoing') }
  scope :done, -> { where(status: 'done') }

  def recently_done?
    (DateTime.now.to_i - completed_at.to_i) < 10
  end

  def recently_created?
    (DateTime.now.to_i - created_at.to_i) < 10
  end
end
