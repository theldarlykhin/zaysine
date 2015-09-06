json.array!(@customers) do |customer|
  json.extract! customer, :id, :full_name, :location, :total_spent
  json.url customer_url(customer, format: :json)
end
