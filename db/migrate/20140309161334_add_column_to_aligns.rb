class AddColumnToAligns < ActiveRecord::Migration
  def change
    add_column :aligns, :aligns_id, :integer
    add_column :aligns, :aligns_type, :string
  end
end
