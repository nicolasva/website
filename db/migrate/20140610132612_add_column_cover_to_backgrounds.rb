class AddColumnCoverToBackgrounds < ActiveRecord::Migration
  def change
    add_column :backgrounds, :cover, :boolean, :null => false, :default => true
  end
end
