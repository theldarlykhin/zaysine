json.array!(@shipping_rates) do |shipping_rate|
  json.extract! shipping_rate, :id, :rate, :paid_all_by_customer, :paid_all_by_merchant, :paid_by_merchant_if_purchase_amount_is
  json.url shipping_rate_url(shipping_rate, format: :json)
end
