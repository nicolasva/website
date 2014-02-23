json.array!(@contents) do |content|
  json.extract! content, :description
  json.url content_url(content, format: :json)
end
