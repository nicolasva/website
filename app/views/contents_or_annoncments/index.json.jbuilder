json.array!(@contents_or_annoncments) do |contents_or_annoncment|
  json.extract! contents_or_annoncment, 
  json.url contents_or_annoncment_url(contents_or_annoncment, format: :json)
end
