class AddColumnWatchTitleToHeaderBackgrounds < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :watch_title, :boolean, default: false, :null => false
  end
end
