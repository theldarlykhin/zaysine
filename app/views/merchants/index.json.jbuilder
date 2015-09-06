json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :store_name
  json.url merchant_url(merchant, format: :json)
end
