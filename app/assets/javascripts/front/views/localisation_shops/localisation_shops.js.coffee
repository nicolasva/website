$(document).ready ->
  if $("#map-canvas").length > 0
    geocoder = new google.maps.Geocoder()
    #latlng = ""
    latlng = new google.maps.LatLng(-34.397, 150.644)
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition (position) ->
        latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
        mapOptions =
          zoom: 8
          center: latlng
        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
        infowindow = new google.maps.InfoWindow({
          map: map,
          position: latlng,
          content: "Votre position"
        })

        map.setCenter(latlng)
        $.getJSON("/localisation_shops/localisation_shops_list", (data) ->
          #console.log data[0].address
          $.each(data, (key, val) ->
            #addr = ""
            #addr = 
            #  'address': val.address+", "+val.postal_code+" "+val.city
            addr = val.address+", "+val.postal_code+" "+val.city
            geocoder.geocode( { 'address' : addr }, (results, status) ->
              if status == google.maps.GeocoderStatus.OK
                #map.setCenter(results[0].geometry.location)
                marker = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
                })
              else
                if status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT
                  wait = true
                  setTimeout("wait = true", 2000)
                else
                  console.log("Geocode was not successful for the following reason: " + status + " with data " + addr)
            )
          )
        )
    else
        latlng = new google.maps.LatLng(48.8534100, 2.3488000)
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
                #map.setCenter(results[0].geometry.location)
                marker = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
                })
              else
                if status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT
                  wait = true
                  setTimeout("wait = true", 2000)
                else
                  console.log("Geocode was not successful for the following reason: " + status + " with data " + addr)
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

