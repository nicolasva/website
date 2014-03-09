json.array!(@aligns) do |align|
  json.extract! align, 
  json.url align_url(align, format: :json)
end
