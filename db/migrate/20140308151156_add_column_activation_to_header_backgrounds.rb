class AddColumnActivationToHeaderBackgrounds < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :activation, :boolean, :default => false
  end
end
