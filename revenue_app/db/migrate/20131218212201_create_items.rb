class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.float :price
      t.references :merchant, index: true

      t.timestamps
    end
    add_index :items, :description
  end
end
