class CreateNiftyCorners < ActiveRecord::Migration
  def change
    create_table :nifty_corners do |t|
      t.boolean :nifty_corner
      t.integer :border_radius
      t.integer :nifty_cornerstyles_id
      t.string :nifty_cornerstyles_type
      t.timestamps
    end
  end
end
