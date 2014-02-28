json.array!(@background_contents) do |background_content|
  json.extract! background_content, 
  json.url background_content_url(background_content, format: :json)
end
