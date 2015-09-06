json.array!(@admins) do |admin|
  json.extract! admin, :id, :username_string
  json.url admin_url(admin, format: :json)
end
