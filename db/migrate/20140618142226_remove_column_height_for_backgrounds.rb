class RemoveColumnHeightForBackgrounds < ActiveRecord::Migration
  def change
    remove_column :backgrounds, :height_screen_client
  end
end
