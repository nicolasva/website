class AddColumnSubMenuOnCategory < ActiveRecord::Migration
  def change
    add_column :categories, :sub_menu, :boolean, default: false
  end
end
