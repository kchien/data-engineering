class AddPurchasesFileToRevenues < ActiveRecord::Migration
  def change
    add_column :revenues, :purchases_file, :string
  end
end
