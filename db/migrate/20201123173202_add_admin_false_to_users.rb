class AddAdminFalseToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :admin, false)
  end
end
