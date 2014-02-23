class AddColumnForEnglishCategoryAndContext < ActiveRecord::Migration
  def change
    add_column(:categories, :english_title, :string, default: "english title")
    add_column(:contents, :english_description, :text)
  end
end
