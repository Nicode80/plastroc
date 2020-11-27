class AddCoordinatesToOrganisations < ActiveRecord::Migration[6.0]
  def change
    add_column :organisations, :latitude, :float
    add_column :organisations, :longitude, :float
  end
end
