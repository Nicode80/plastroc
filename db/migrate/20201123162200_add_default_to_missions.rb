class AddDefaultToMissions < ActiveRecord::Migration[6.0]
  def change
    change_column_default :missions, :status, 'ongoing'
  end
end
