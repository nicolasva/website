class AddColumnMarginLeftToMenus < ActiveRecord::Migration
  def change
    add_column :menu_backgrounds, :margin_left, :integer, null: false, default: "10"
  end
end
