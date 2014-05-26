class CreateGaleryPhotos < ActiveRecord::Migration
  def change
    create_table :galery_photos do |t|
      t.string :uuid, :null => false
      t.string :title, :null => false
      t.text :comment, :null => false
      t.string :photogalery
      t.string :photogalery_cache
      t.timestamps
    end
  end
end
