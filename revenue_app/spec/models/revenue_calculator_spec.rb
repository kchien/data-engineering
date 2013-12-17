require 'rspec/given'
require 'spec_helper_lite'
needs   'app/models'
require 'revenue_calculator'

describe RevenueCalculator do
  context "orders file has only one line of data" do
    Given(:orders_file) {
    """
  purchaser name        item description        item price        purchase count        merchant address        merchant name
  Snake Plissken        $10 off $20 of food        10.0        2        987 Fake St        Bob's Pizza

    """
    }

    Given(:calculator) { described_class.new }

    When(:revenue) { calculator.calculate_revenue_from_file(orders_file) }

    Then {
      revenue.should == 10.0
    }
  end
end
