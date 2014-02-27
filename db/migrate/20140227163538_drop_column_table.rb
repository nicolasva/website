class DropColumnTable < ActiveRecord::Migration
  def change
    remove_column :categories, :homepage
    remove_column :categories, :content_or_annoncment
  end
end
