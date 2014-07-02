class AddColumnFontColorHeaderBackground < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :font_color_title, :string, null: false, default: "black"
  end
end
