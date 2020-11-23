class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.integer :step_order
      t.string :title
      t.text :content
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
