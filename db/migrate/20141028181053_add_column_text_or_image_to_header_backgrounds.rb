class AddColumnTextOrImageToHeaderBackgrounds < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :text_or_image, :boolean, null: false, default: true
  end
end
