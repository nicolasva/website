class ModifyDefaultValueOpacityToBackgrounds < ActiveRecord::Migration
  def change
    change_column :backgrounds, :opacity, :float, null: false, default: 1
  end
end
