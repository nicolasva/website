json.array!(@galery_photos) do |galery_photo|
  json.extract! galery_photo, 
  json.url galery_photo_url(galery_photo, format: :json)
end
