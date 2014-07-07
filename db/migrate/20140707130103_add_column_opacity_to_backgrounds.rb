class AddColumnOpacityToBackgrounds < ActiveRecord::Migration
  def change
    add_column :backgrounds, :opacity, :float, :null => false, :default => 0.0
  end
end
