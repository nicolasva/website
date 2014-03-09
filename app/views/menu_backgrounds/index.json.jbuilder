json.array!(@menu_backgrounds) do |menu_background|
  json.extract! menu_background, 
  json.url menu_background_url(menu_background, format: :json)
end
