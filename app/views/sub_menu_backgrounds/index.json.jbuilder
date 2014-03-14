json.array!(@sub_menu_backgrounds) do |sub_menu_background|
  json.extract! sub_menu_background, 
  json.url sub_menu_background_url(sub_menu_background, format: :json)
end
