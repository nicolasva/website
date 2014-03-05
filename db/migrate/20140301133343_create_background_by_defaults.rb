class CreateBackgroundByDefaults < ActiveRecord::Migration
  def change
    create_table :background_by_defaults do |t|
      t.string :title, null: false
      t.timestamps
    end
  end
end
