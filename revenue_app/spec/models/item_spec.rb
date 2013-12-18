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

 context "creating multiple items" do
   it "creates items with same name, but different price" do
     item1 = described_class.create(description: "bread", price: 1.0)
     item2 = described_class.create(description: "bread", price: 3.0)
     expect(described_class.where(description: "bread").count).to eq(2)
   end

   it "creates items with same price, but different name" do
     item1 = described_class.create(description: "cereal", price: 3.0)
     item2 = described_class.create(description: "bread", price: 3.0)
     expect(described_class.where(price: 3.0).count).to eq(2)
   end

   it "does not creates items with same price and name" do
     2.times { described_class.create(description: "cereal", price: 3.0) }
     expect(described_class.where(description: "cereal").count).to eq(1)
   end

 end
end
