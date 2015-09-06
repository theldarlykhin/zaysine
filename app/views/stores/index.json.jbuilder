json.array!(@stores) do |store|
  json.extract! store, :id, :name, :item_id, :contact_number, :contact_address
  json.url store_url(store, format: :json)
end
