class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :description, :null => false
      t.references :category
      t.timestamps
    end
  end
end
