class ModificationContentOrAnnoncmentToContentsOrAnnoncmentsValueByDefault < ActiveRecord::Migration
  def change 
    change_column :contents_or_annoncments, :content_or_annoncment, :integer, null: false, :default => 1
  end
end
