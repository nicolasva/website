json.array!(@header_backgrounds) do |header_background|
  json.extract! header_background, 
  json.url header_background_url(header_background, format: :json)
end
