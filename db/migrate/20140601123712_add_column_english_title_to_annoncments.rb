class AddColumnEnglishTitleToAnnoncments < ActiveRecord::Migration
  def change
    add_column :annoncments, :english_title, :string, :null => false, :default => "English title"
  end
end
