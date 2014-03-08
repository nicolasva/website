class CreateFooterBackgrounds < ActiveRecord::Migration
  def change
    create_table :footer_backgrounds do |t| 
      t.string :uuid, :null => false
      t.string :title, :null => false
      t.boolean :activation, :null => false
      t.timestamps
    end
  end
end
