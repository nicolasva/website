class CreateBackgroundContents < ActiveRecord::Migration
  def change
    create_table :background_contents do |t|
      t.references :content
      t.timestamps
    end

    add_index :background_contents, [:content_id], :name => :background_content_id_to_contents
  end
end
