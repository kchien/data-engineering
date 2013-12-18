class Revenue < ActiveRecord::Base
  mount_uploader :purchases_file, PurchasesUploader

  def update_total_to(total_revenue)
    update(total: total_revenue)
  end
end
