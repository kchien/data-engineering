require 'csv'
class RevenueCalculator
  def calculate_revenue_from_file(file)
    csv = CSV.parse(file, headers:true, col_sep: "\t", skip_blanks: true, converters: :numeric)

    csv.map do |row|
      return row["item price"] * row["purchase count"]
    end
  end
end
