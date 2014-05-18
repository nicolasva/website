class AddTableAnnoncmentPersonalisation < ActiveRecord::Migration
  def change
    create_table :personalize_backgrounds do |t|
      t.string :title, null: false
      t.string :uuid, null: false
      t.boolean :activation, null: false, default: false
      t.timestamps
    end
  end
end
