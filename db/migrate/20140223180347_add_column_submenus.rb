class AddColumnSubmenus < ActiveRecord::Migration
  def change
    add_column :submenus, :position, :integer, :default => 0
    add_column :submenus, :created_at, :datetime
    add_column :submenus, :updated_at, :datetime
  end
end
