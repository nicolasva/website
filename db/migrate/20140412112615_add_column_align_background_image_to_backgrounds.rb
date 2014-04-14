class AddColumnAlignBackgroundImageToBackgrounds < ActiveRecord::Migration
  def change
    add_column :backgrounds, :align, :integer, :default => 0
  end
end
