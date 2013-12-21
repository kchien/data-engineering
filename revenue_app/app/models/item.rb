class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :purchases

  validates :description, uniqueness: { scope: :price,
    message: "can't be listed more than once w/same price" }
end
