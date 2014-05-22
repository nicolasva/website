class AddColumnMarginToAnnoncments < ActiveRecord::Migration
  def change
    add_column :annoncments, :margin_top, :integer, default: 0, null: false
  end
end
