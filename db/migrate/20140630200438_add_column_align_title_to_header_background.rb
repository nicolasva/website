class AddColumnAlignTitleToHeaderBackground < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :align_title, :integer, :null => false, :default => 0
  end
end
