class AddColumnSizeTitleToHeaderBackground < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :size_title, :integer, :null => false, :default => 12
  end
end
