class AddColumnActivationToBackgroundByDefaults < ActiveRecord::Migration
  def change
    add_column :background_by_defaults, :activation, :boolean, default: false
  end
end
