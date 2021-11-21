class CreateMaterialCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :material_categories do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
