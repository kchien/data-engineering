class AddReferencesToPurchase < ActiveRecord::Migration
  def change
    add_reference :purchases, :customer, index: true
    add_reference :purchases, :item, index: true
  end
end
