class AddCompletedAtToMissions < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :completed_at, :datetime
  end
end
