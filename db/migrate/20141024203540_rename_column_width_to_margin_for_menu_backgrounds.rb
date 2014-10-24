class RenameColumnWidthToMarginForMenuBackgrounds < ActiveRecord::Migration
  def change
    rename_column :menu_backgrounds, :width, :margin_right 
  end
end
