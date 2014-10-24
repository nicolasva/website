class RenameColumnMarginLeftToWidth < ActiveRecord::Migration
  def change
    rename_column :menu_backgrounds, :margin_left, :width
  end
end
