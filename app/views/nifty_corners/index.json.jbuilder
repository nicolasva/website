json.array!(@nifty_corners) do |nifty_corner|
  json.extract! nifty_corner, :id
  json.url nifty_corner_url(nifty_corner, format: :json)
end
