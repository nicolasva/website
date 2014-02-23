class AddConstraintCategoryOnSubmenus < ActiveRecord::Migration
  def change
    add_column :submenus, :category_id, :integer
  
    add_index :submenus, [:category_id], name: "submenus_category_id_to_category"
  end
end
