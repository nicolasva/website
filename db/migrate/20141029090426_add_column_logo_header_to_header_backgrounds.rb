class AddColumnLogoHeaderToHeaderBackgrounds < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :logo, :string, null: true
    add_column :header_backgrounds, :cached_path, :string
    add_column :header_backgrounds, :logo_cache, :string
    add_column :header_backgrounds, :logo_size, :integer, default: 0
  end
end
