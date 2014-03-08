class CreateHeaderBackgrounds < ActiveRecord::Migration
  def change
    create_table :header_backgrounds do |t|
      t.string :title, :null => false
      t.string :uuid, :null => false
      t.timestamps
    end
  end
end
