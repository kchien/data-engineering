require 'spec_helper'
describe Merchant do
 context "setting its default attributes" do
   it "has an address and a name" do
     address = '123 Fake St.'
     name = 'S Mart'
     merchant = described_class.create(address: address, name: name)
     expect(merchant.address).to eq(address)
     expect(merchant.name).to eq(name)
   end
 end
end
