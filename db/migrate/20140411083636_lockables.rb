class Lockables < ActiveRecord::Migration
  def change
    create_table :locakables do |t|
      t.boolean :lockable, :null => false, :default => true
      t.integer :lockables_id
      t.string :lockables_type
    end
  end
end
