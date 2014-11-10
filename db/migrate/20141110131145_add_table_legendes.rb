class AddTableLegendes < ActiveRecord::Migration
  def change
    create_table :legendes do |t|
      t.text :legende, null: false
      t.integer :legendstyles_id
      t.string :legendstyles_type
      t.timestamps
    end
  end
end
