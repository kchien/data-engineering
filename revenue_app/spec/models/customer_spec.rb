require 'pry'
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

  context "using data from plain text file" do
    let(:line_item) {
      {"purchaser name" => "Naked Snake",
       "item description" => "$10 off $20 of eye patches",
       "item price" => 10.0,
       "purchase count" => 2,
       "merchant address" => "987 Fake St",
       "merchant name" => "Bob's Eye Patch Stop"}
    }

    let(:snake_sneaker_deal) {
      {"purchaser name" => "Naked Snake",
       "item description" => "$20 Sneakers for $5",
       "item price" => 5.0,
       "purchase count" => 4,
       "merchant address" => "123 Fake St",
       "merchant name" => "Sneaker Store Emporium"}
    }

    it "stores a customer and his/her purchase(s)" do
      expect {
        described_class.store_purchases([line_item])
      }.to change { Customer.count }.by(1)
    end

    it "stores the data in customer and associated models" do
       customer = described_class.store_purchases([line_item])
       expect(customer[0].name).to eq(line_item["purchaser name"])
       expect(customer[0].purchases.first.quantity).to eq(line_item["purchase count"])

       expect(customer[0].items.map(&:description)).to eq([line_item["item description"]])
       expect(customer[0].items.map(&:price)).to eq([line_item["item price"]])

       expect(customer[0].items[0].merchant.name).to eq(line_item["merchant name"])
       expect(customer[0].items[0].merchant.address).to eq(line_item["merchant address"])
    end

    context "input has two line items from same customer" do
      it "links the data to one customer,w/o creating two customers " do
        described_class.store_purchases([line_item,
	  snake_sneaker_deal])

        relation = Customer.where(name: "Naked Snake")
	c = relation.first

        expect(relation.count).to eq(1)
	expect(c.purchases.count).to eq(2)
      end
    end
  end
end
