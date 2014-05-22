class AddColumnAnnoncmentFontWeightAndFontSizeForTitle < ActiveRecord::Migration
  def change
    add_column :annoncments, :font_weight_title, :integer, :null => false, :default => 0
    add_column :annoncments, :font_size_title, :integer, :null => false, :default => 12
    add_column :annoncments, :text_decoration_title, :integer, :null => false, :default => 0
  end
end
