json.array!(@footers) do |footer|
  json.extract! footer, 
  json.url footer_url(footer, format: :json)
end
