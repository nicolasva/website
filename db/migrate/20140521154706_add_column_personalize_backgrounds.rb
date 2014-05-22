class AddColumnPersonalizeBackgrounds < ActiveRecord::Migration
  def change
    add_column :personalize_backgrounds, :margin_top, :integer, :default => 0, :null => false
  end
end
