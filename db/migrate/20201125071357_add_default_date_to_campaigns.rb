class AddDefaultDateToCampaigns < ActiveRecord::Migration[6.0]
  def change
    change_column_default :campaigns, :start_date, Date.current
  end
end
