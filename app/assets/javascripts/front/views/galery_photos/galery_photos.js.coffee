jQuery ->
  $(document).ready ->
    #$('a.zoombox').zoombox() if exp_galery_photos.test(location_href)
    if $(".fancybox").length > 0
      $(".fancybox").fancybox(
        prevEffect	: 'elastic',
        nextEffect	: 'elastic',
        openEffect	: 'elastic',
        closeEffect	: 'elastic',

        helpers: {
    		  title: { type: 'inside' }
        }	
      )
