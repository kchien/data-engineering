require 'spec_helper'
describe Customer do
  let(:chuck) { 'Chuck Norris' }
  let(:chuck_attrs) { {name: chuck} }

  context "setting the name" do
    it "persists the name" do
      customer = described_class.new(name: chuck)
      customer.name.should == chuck
    end
  end

  context "attemping to create duplicate customers" do
    it "does not allow customers with the same name to be created" do
      customer = described_class.create(chuck_attrs)
      expect {
        described_class.create!(chuck_attrs)
      }.to raise_error
    end
  end
end
