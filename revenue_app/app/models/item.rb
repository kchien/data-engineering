class Item < ActiveRecord::Base
  belongs_to :merchant

  validates :description, uniqueness: { scope: :price,
    message: "can't be listed more than once w/same price" }
end
