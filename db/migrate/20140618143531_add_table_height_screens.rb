class AddTableHeightScreens < ActiveRecord::Migration
  def change
    create_table :height_screens, force: true do |t|
      t.boolean :height, null: false, default: true
      t.integer :height_screenstyles_id, null: false
      t.string :height_screenstyles_type, null: false
    end
  end
end
