json.array!(@annoncments) do |annoncment|
  json.extract! annoncment, 
  json.url annoncment_url(annoncment, format: :json)
end
