json.array!(@background_by_defaults) do |background_by_default|
  json.extract! background_by_default, 
  json.url background_by_default_url(background_by_default, format: :json)
end
