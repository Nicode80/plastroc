class AddCategoryToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :category, :string
  end
end
