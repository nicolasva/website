$(document).ready ->
  geocoder = new google.maps.Geocoder()
  latlng = new google.maps.LatLng(-34.397, 150.644)
  mapOptions =
    zoom: 8
    center: latlng
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  $.getJSON("/localisation_shops/localisation_shops_list", (data) ->
    #console.log data[0].address
    $.each(data, (key, val) ->
      #addr = ""
      #addr = 
      #  'address': val.address+", "+val.postal_code+" "+val.city
      addr = val.address+", "+val.postal_code+" "+val.city
      geocoder.geocode( { 'address' : addr }, (results, status) ->
        if status == google.maps.GeocoderStatus.OK
          map.setCenter(results[0].geometry.location)
          marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
          })
        else
          alert("Geocode was not successful for the following reason: " + status)
      )
    )
  )
  #$.ajax({
  #    url: "/localisation_shops/localisation_shops_list"
  #    type: "GET"
  #    success: (response) ->
  #      console.log response
  #     
        #geocoder.geocode( { 'address', data[0].address+", "+data[0].postal_code+" "+response.city)
        #    failure: (response) ->
        #      alert "Failure"

  #})

