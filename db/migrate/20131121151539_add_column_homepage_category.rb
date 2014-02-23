class AddColumnHomepageCategory < ActiveRecord::Migration
  def change
    add_column :categories, :homepage, :boolean, default: false
    add_column :categories, :position, :integer, default: 1
  end
end
