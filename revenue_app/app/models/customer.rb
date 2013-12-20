class Customer < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.store_purchases(csv)
  end
end
