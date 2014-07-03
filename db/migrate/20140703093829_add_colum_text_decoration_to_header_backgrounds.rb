class AddColumTextDecorationToHeaderBackgrounds < ActiveRecord::Migration
  def change
    add_column :header_backgrounds, :text_decoration, :integer, null: false, default: 0
  end
end
