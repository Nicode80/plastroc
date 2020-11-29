class AddDefaultValueForMinPackage < ActiveRecord::Migration[6.0]
  def change
    change_column_default :campaigns, :min_package, 1
  end
end
