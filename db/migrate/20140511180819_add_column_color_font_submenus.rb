class AddColumnColorFontSubmenus < ActiveRecord::Migration
  def change
    add_column :submenus, :color_font, :string, :default => 'black', :null => false
  end
end
