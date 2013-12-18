require 'rspec/given'
require 'spec_helper_lite'
needs   'app/models'
require 'revenue_calculator'
require 'pry'

describe RevenueCalculator do
  Given(:calculator) { described_class.new }

  Given(:full_path_to_file) {
    filename = "sample_input.tab"
    write_file(filename, file_contents)
    File.join(current_dir, filename)
  }

  context "orders file has only one line of data where customer bought one item" do
    Given(:file_contents) {
%Q{purchaser name	item description	item price	purchase count	merchant address	merchant name
Snake Plissken	$10 off $20 of food	10.0	1	987 Fake St	Bob's Pizza}
    }

    When(:revenue) {
      calculator.calculate_revenue_from_file(full_path_to_file)
    }

    Then {
      revenue.should == 10.0
    }

    context "customer bought two (2) of the same item" do
      Given(:file_contents) {
%Q{purchaser name	item description	item price	purchase count	merchant address	merchant name
Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza}
      }

      When(:revenue) {
       calculator.calculate_revenue_from_file(full_path_to_file)
      }

      Then {
        revenue.should == 20.0
      }
    end
  end

  context "orders file has two lines of data from two different customers" do
    Given(:file_contents) {
%Q{purchaser name	item description	item price	purchase count	merchant address	merchant name
Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	$30 of awesome for $10	10.0	5	456 Unreal Rd	Tom's Awesome Shop}
    }

    When(:revenue) {
     calculator.calculate_revenue_from_file(full_path_to_file)
    }

    Then { revenue.should == 70.0 }
  end

  context "orders file has lines with duplicate merchants and customers" do
    Given(:file_contents) {
%Q{purchaser name	item description	item price	purchase count	merchant address	merchant name
Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	$30 of awesome for $10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
Marty McFly	$20 Sneakers for $5	5.0	1	123 Fake St	Sneaker Store Emporium
Snake Plissken	$20 Sneakers for $5	5.0	4	123 Fake St	Sneaker Store Emporium}
    }

    When(:revenue) {
     calculator.calculate_revenue_from_file(full_path_to_file)
    }

    Then { revenue.should == 95.0 }
  end

  context "orders file has dollars and cents" do
    Given(:file_contents) {
%Q{purchaser name	item description	item price	purchase count	merchant address	merchant name
Snake Plissken	$10 off $20 of food	10.33	2	987 Fake St	Bob's Pizza}
    }

    When(:revenue) {
     calculator.calculate_revenue_from_file(full_path_to_file)
    }

    Then { revenue.should == 20.66 }
  end
end
