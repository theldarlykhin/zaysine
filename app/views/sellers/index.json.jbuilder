json.array!(@sellers) do |seller|
  json.extract! seller, :id, :username_string, :store_id
  json.url seller_url(seller, format: :json)
end
