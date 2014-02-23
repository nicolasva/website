class AddColumnContentOrAnnouncmentToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :content_ot_annoncment, :boolean, :null => false, :default => true
  end
end
