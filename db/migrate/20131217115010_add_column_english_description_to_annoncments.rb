class AddColumnEnglishDescriptionToAnnoncments < ActiveRecord::Migration
  def change
    add_column :annoncments, :english_description, :text, :null => true, :default => ""
  end
end
