require 'csv'
class RevenueCalculator
  def calculate_revenue_from_file(file)
    csv = CSV.read(file, headers:true, col_sep: "\t", skip_blanks: true, converters: :numeric)

    csv.reduce(0) {|revenue, row|
      revenue + row["item price"] * row["purchase count"]
    }
  end
end
