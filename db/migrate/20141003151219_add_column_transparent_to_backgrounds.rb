class AddColumnTransparentToBackgrounds < ActiveRecord::Migration
  def change
    add_column :backgrounds, :transparent, :boolean, default: true, null: false
  end
end
