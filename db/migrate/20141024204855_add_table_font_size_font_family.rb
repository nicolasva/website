class AddTableFontSizeFontFamily < ActiveRecord::Migration
  def change
    create_table :fonts, force: true do |t|
      t.integer :font_family, :integer, null: false, default: 0
      t.integer :font_size, :integer, null: false, default: 12
      t.integer :fontstyles_id
      t.string :fontstyles_type
    end
  end
end
