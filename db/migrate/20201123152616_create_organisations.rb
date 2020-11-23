class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.text :about
      t.string :address
      t.integer :postcode
      t.string :city
      t.string :contact
      t.string :opening_hours
      t.references :user

      t.timestamps
    end
  end
end
