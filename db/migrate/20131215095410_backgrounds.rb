class Backgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.integer :border, :null => false, :default =>  "0px"
      t.string :border_style, :null => false, :default => "solid"
      t.string :border_color, :null => false, :default => "transparent"
      t.string :background_color, :default => "transparent"
      t.string :background_image, :null => true
      t.string :cached_path, :null => true
      t.integer :backgroundstyles_id
      t.string :backgroundstyles_type
    end
  end
end
