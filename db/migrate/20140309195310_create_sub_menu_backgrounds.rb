class CreateSubMenuBackgrounds < ActiveRecord::Migration
  def change
    create_table :sub_menu_backgrounds do |t|
      t.string :uuid, :null => false
      t.string :title, :null => false
      t.boolean :activation, :null => false, :default => false
      t.timestamps
    end
  end
end
