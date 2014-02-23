class AddColumnUuidToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :uuid, :string, :null => false, :default => 0
  end
end
