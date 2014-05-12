class AddColumnEnglishTitleToSubmenus < ActiveRecord::Migration
  def change
    add_column :submenus, :english_title, :string, :null => false, :default => "English title submenu"
  end
end
