json.array!(@footer_backgrounds) do |footer_background|
  json.extract! footer_background, 
  json.url footer_background_url(footer_background, format: :json)
end
