class Customer < ActiveRecord::Base
  has_many :purchases
  has_many :items, through: :purchases

  validates :name, uniqueness: true

  def self.store_purchases(csv)
    csv.map do |c|
      Customer.find_or_create_by(name: c["purchaser name"]).tap { |customer|
      m = Merchant.find_or_create_by(name: c["merchant name"],
	                     address: c["merchant address"])
      item = m.items.find_or_create_by(description: c["item description"],
                              price: c["item price"])
      item.purchases.create(customer: customer,
                            quantity:c["purchase count"])
      
      }
    end
  end
end
