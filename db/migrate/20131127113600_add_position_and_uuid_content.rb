class AddPositionAndUuidContent < ActiveRecord::Migration
  def change
    add_column :contents, :position, :integer, :null => false, :default => 1
    add_column :contents, :uuid, :string, :null => false, :default => ""
  end
end
