class CreateAligns < ActiveRecord::Migration
  def change
    #0 => top, 1 => left, 2 => right
    create_table :aligns do |t|
      t.integer :align, :null => false
      t.timestamps
    end
  end
end
