json.array!(@revenues) do |revenue|
  json.extract! revenue, :id, :total
  json.url revenue_url(revenue, format: :json)
end
