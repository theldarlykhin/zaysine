json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :name, :email, :login
  json.url invoice_url(invoice, format: :json)
end
