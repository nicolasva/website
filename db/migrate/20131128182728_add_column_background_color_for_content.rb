class AddColumnBackgroundColorForContent < ActiveRecord::Migration
  def change
    add_column :contents, :border, :integer, :null => false, :default => "0px"
    add_column :contents, :border_style, :string, :null => false, :default => "solid"
    add_column :contents, :border_color, :string, :null => false, :default => "transparent"
    add_column :contents, :background_color, :string, :default => 'transparent'
    add_column :contents, :background_image, :string, :null => true
    add_column :contents, :cached_path, :string, :null => true
  end
end
