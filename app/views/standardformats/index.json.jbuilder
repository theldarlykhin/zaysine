json.array!(@standardformats) do |standardformat|
  json.extract! standardformat, :id, :timezone, :currency, :unitsystemstring, :defaultweightunit
  json.url standardformat_url(standardformat, format: :json)
end
