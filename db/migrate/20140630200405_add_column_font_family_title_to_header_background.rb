class AddColumnFontFamilyTitleToHeaderBackground < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :font_family_title, :integer, :null => false, :default => 0
  end
end
