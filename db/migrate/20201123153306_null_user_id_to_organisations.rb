class NullUserIdToOrganisations < ActiveRecord::Migration[6.0]
  def change
    change_column_null :organisations, :user_id, false
  end
end
