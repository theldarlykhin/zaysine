json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :brand, :type, :color
  json.url product_url(product, format: :json)
end
