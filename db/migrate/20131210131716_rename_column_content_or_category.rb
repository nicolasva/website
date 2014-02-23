class RenameColumnContentOrCategory < ActiveRecord::Migration
  def change
    rename_column :categories, :content_ot_annoncment, :content_or_annoncment
  end
end
