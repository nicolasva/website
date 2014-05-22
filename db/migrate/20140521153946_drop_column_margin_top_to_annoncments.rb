class DropColumnMarginTopToAnnoncments < ActiveRecord::Migration
  def change
    remove_column :annoncments, :margin_top
  end
end
