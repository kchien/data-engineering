require 'spec_helper'

describe RevenuesController do
  describe "POST #create" do
    it "passes an uploaded file to the Revenue calculator" do
      calculator = double("revenue calculator")
      RevenueCalculator.stub(:new).and_return(calculator)

      calculator.should_receive(:calculate_revenue_from_file)

      post :create, revenue: {total: 30} 
    end
  end
end
