class CreateFooters < ActiveRecord::Migration
  def change
    create_table :footers do |t|
      t.string :legal_mention, null: false
      t.timestamps
    end
  end
end
