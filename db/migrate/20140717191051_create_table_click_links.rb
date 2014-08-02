class CreateTableClickLinks < ActiveRecord::Migration
  def change
    create_table :click_links do |t|
      t.string :color, null: false, default: "black"
      t.string :background_color, null: false, default: "white"
      t.integer :click_linkstyles_id
      t.string :click_linkstyles_type
    end
  end
end
