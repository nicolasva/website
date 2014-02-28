json.array!(@background_annoncments) do |background_annoncment|
  json.extract! background_annoncment, 
  json.url background_annoncment_url(background_annoncment, format: :json)
end
