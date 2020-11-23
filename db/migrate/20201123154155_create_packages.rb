class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :quantity
      t.integer :xp_reward
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
