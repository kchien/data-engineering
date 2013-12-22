require 'spec_helper'

describe RevenuesController do
  describe "POST #create" do
    it "passes an uploaded file to the Revenue calculator" do
      calculator = double("revenue calculator")
      RevenueCalculator.stub(:new).and_return(calculator)

      calculator.should_receive(:calculate_revenue_from_file)\
         .with("/foo/bar.txt")

      post :create, revenue: {purchases_file: "/foo/bar.txt"} 
    end
  end
end
