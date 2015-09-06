json.array!(@merchant_infos) do |merchant_info|
  json.extract! merchant_info, :id, :name, :account_email, :customer_email, :storename, :phone, :street, :city, :postal
  json.url merchant_info_url(merchant_info, format: :json)
end
