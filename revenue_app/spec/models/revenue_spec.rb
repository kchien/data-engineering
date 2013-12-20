require 'spec_helper'

describe Revenue do
  it "stores a total revenue, for a given file" do
    foo_file = ""
    total_revenue = 25.42

    revenue = described_class.create(purchases_file: foo_file)
    revenue.update_total_to(total_revenue)

    expect(revenue.total).to eq(total_revenue)
  end

  it "provides the full path to its associated plain text file" do
    this_file = __FILE__

    revenue = described_class.new(purchases_file: File.open(this_file))

    expect(revenue.purchases_file_path).to match /revenue_spec\.rb$/
  end
end

