json.array!(@homepage_submenus) do |homepage_submenu|
  json.extract! homepage_submenu, 
  json.url homepage_submenu_url(homepage_submenu, format: :json)
end
