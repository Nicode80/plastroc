class AddEndStartDateToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :start_date, :string
    add_column :campaigns, :end_date, :string
  end
end
