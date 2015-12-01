json.array!(@businesses) do |business|
  json.extract! business, :id, :uuid, :name
  json.url business_url(business, format: :json)
end
