class CreateMenuBackgrounds < ActiveRecord::Migration
  def change
    create_table :menu_backgrounds do |t|
      t.string :uuid, :null => false
      t.string :title, :null => false
      t.boolean :activation, :default => false, :null => false
      t.timestamps
    end
  end
end
