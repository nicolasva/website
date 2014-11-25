class AddColumnColorToFooterBackgrounds < ActiveRecord::Migration
  def change
    add_column :footer_backgrounds, :color_font, :string, null: false, default: "black"
  end
end
