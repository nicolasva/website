class AddTablePublications < ActiveRecord::Migration
  def change
    create_table :publications, force: true do |t|
      t.boolean :publication, null: false, default: true
      t.integer :publicationstyles_id
      t.string :publicationstyles_type
      t.timestamps
    end
  end
end
