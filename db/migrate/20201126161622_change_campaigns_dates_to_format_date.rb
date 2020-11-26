class ChangeCampaignsDatesToFormatDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :start_date
    remove_column :campaigns, :end_date
    add_column :campaigns, :start_date, :date
    add_column :campaigns, :end_date, :date
  end
end
