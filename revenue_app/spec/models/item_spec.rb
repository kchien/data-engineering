require 'spec_helper'
describe Item do
 context "setting its default attributes" do
   it "has an address and a name" do
     description = 'Sneakers for $5'
     price = 5.0
     item = described_class.create(description: description, price: price)
     expect(item.description).to eq(description)
     expect(item.price).to eq(price)
   end
 end
end
