require 'csv'

class RevenueCalculator
  def calculate_revenue_from_file(file, revenue_for_file)
    csv = CSV.read(file, headers:true, col_sep: "\t", skip_blanks: true, converters: :numeric)

    revenue_for_file.update_total_to(sum_of_all_revenues_in(csv))
  end

  def sum_of_all_revenues_in csv
    csv.reduce(0) {|revenue, row|
      revenue + row["item price"] * row["purchase count"]
    }
  end

end
