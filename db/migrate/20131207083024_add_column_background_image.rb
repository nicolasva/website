class AddColumnBackgroundImage < ActiveRecord::Migration
  def change
    add_column :contents, :no_background_image, :boolean, null: false, default: true
  end
end
