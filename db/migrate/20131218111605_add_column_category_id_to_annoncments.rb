class AddColumnCategoryIdToAnnoncments < ActiveRecord::Migration
  def change
    add_column :annoncments, :category_id, :integer
    add_index "annoncments", ["category_id"], name: "annoncments_category_id_to_category"
  end
end
