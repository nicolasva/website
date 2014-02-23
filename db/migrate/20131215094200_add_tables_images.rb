class AddTablesImages < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo, :null => true
      t.string :photo_cache, :null => true
      t.references :annoncments
    end
  end
end
