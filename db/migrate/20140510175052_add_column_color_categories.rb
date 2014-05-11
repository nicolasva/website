class AddColumnColorCategories < ActiveRecord::Migration
  def change
    add_column :categories, :color_font, :string, default: "black", null: false
  end
end
