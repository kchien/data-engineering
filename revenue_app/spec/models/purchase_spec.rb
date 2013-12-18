require 'spec_helper'
describe Purchase do
 context "setting the quantity" do
   it "persists the quantity" do
     quantity = 3 
     purchase = described_class.new(quantity: quantity)
     purchase.quantity.should == quantity
   end
 end
end
