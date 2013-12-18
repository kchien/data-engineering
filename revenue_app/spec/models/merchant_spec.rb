require 'spec_helper'
describe Merchant do
 it { should have(0).items }
 
 context "setting its default attributes" do
   it "has an address and a name" do
     address = '123 Fake St.'
     name = 'S Mart'
     merchant = described_class.create(address: address, name: name)
     expect(merchant.address).to eq(address)
     expect(merchant.name).to eq(name)
   end
 end


 context "after adding some items" do
   it "contains those items" do
     quick_e_mart = described_class.create(address: "Foo St.", name: 'Quick-E-Mart')
     milk = quick_e_mart.items.create(description: "Milk", price: 0.25)

     expect(quick_e_mart.items).to eq([milk])
   end
 end
end
