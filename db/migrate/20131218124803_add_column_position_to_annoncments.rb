class AddColumnPositionToAnnoncments < ActiveRecord::Migration
  def change
    add_column :annoncments, :position, :integer, :null => false, :default => 0
  end
end
