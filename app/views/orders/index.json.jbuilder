json.array!(@orders) do |order|
  json.extract! order, :id, :store_id, :customer_name, :customer_phone, :customer_email, :customer_address
  json.url order_url(order, format: :json)
end
