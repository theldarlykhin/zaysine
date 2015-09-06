json.array!(@brands) do |brand|
  json.extract! brand, :id, :brand_name
  json.url brand_url(brand, format: :json)
end
