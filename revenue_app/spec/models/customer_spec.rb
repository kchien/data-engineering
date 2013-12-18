require 'spec_helper'
describe Customer do
 context "setting the name" do
   it "persists the name" do
     chuck = 'Chuck Norris'
     customer = described_class.new(name: chuck)
     customer.name.should == chuck
   end
 end
end
