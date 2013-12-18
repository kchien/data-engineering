class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.decimal :total

      t.timestamps
    end
  end
end
