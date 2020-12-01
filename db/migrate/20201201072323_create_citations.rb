class CreateCitations < ActiveRecord::Migration[6.0]
  def change
    create_table :citations do |t|
      t.string :author
      t.text :quote

      t.timestamps
    end
  end
end
