jQuery ->
  $(document).ready ->
    location_href = window.location.href
    exp_galery_photos = new RegExp("^.{1,}(galery_photos)$","g")
    $('a.zoombox').zoombox() if exp_galery_photos.test(location_href)
