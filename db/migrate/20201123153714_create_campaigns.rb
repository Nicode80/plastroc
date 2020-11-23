class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.string :status
      t.integer :target
      t.string :unit
      t.boolean :published, default: false, null: false
      t.integer :min_package
      t.references :material, null: false, foreign_key: true
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
