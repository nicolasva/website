class AddColumnConstraintSubmenuOnContentAndAnnoncment < ActiveRecord::Migration
  def change
    add_column :annoncments, :submenu_id, :integer
    add_index :annoncments, [:submenu_id], name: "annoncments_submenu_id_to_submenus"

    add_column :contents, :submenu_id, :integer
    add_index :contents, [:submenu_id], name: "contents_submenu_id_to_submenus"
  end
end
