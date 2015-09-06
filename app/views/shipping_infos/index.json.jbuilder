json.array!(@shipping_infos) do |shipping_info|
  json.extract! shipping_info, :id, :full_name, :contact_number, :email, :city, :township, :shipping_address
  json.url shipping_info_url(shipping_info, format: :json)
end
