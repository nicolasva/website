class AddColumnFontColorToPersonalizeBackground < ActiveRecord::Migration
  def change
    add_column :personalize_backgrounds, :font_color, :string, :default => "black", :null => false
  end
end
