require 'csv'

class RevenueCalculator
  def initialize(customer_base=Customer)
    @customer_base = customer_base
  end

  def calculate_revenue_from_file(file, revenue_for_file)
    csv = parse_line_items_from_file(file)

    customer_base.store_purchases(csv)

    revenue_for_file.update_total_to(sum_of_all_revenues_in(csv))
  end

  def sum_of_all_revenues_in(csv)
    csv.reduce(0) {|revenue, row|
      revenue + row["item price"] * row["purchase count"]
    }
  end

private
  attr_reader :customer_base

  def parse_line_items_from_file(file)
    attrs= {headers:true, 
            col_sep: "\t",
	    skip_blanks: true, 
	    converters: :numeric}
    CSV.read(file, attrs)
  end
end
