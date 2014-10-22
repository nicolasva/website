HASH_ALIGN_CSS =
  0 : "center center"
  3 : "right bottom"
  4 : "right top"
  5 : "right center"
  6 : "left top"
  7 : "left center"
  8 : "left bottom"
  9 : "center top"
  10 : "center bottom"
  11 : "center center"
  12 : "full screen"

HASH_ANNONCMENT_FONT_WEIGHT_TITLE = 
  0: "normal"
  1: "lighter"
  2: "bold"
  3: "bolder"

HASH_ANNONCMENT_TEXT_DECORATION_TITLE =
  0: "none"
  1: "underline"
  2: "overline"
  3: "line-through"
  4: "blink"

jQuery ->
  $(document).ready ->
    exp_personalize_galery_photo_background = new RegExp("^.{1,}(galery_photos)$","g")
    location_href  = window.location.href

    exp_get_url = new RegExp("(^.{1,})galery_photos$","g")
    unless _.isEmpty(location_href.scan(exp_personalize_galery_photo_background))
      get_url = location_href.scan(exp_get_url)[0][0]
      if exp_personalize_galery_photo_background.test(location_href)
        $.getJSON("/personalize_galery_photo_backgrounds", (data) ->
          #$("#Galery_photo")
          unless _.isNull(data)
            $("#Galery_photo").css("background-color", if data.background.transparent is true then "transparent" else  data.background.background_color)
            $("#Galery_photo").css("background-color", data.background.background_color)
            $("#Galery_photo").css("background", "url('"+data.background.background_image.url+"') "+ if data.background.no_repeat is true then 'no-repeat' else '') unless data.background.no_background_image
            $("#Galery_photo").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
            #$("#Galery_photo").css("height", window.screen.height + "px") if data.height_screen.height
            set_nifty_corner("#Galery_photo", data)
            set_opacity_background("#Galery_photo", data.background)
        )


set_opacity_background = (element, background) ->
  $(element).css("opacity", background.opacity)

set_nifty_corner = (element, data) ->
  unless _.isUndefined(data.nifty_corner)
    if data.nifty_corner.nifty_corner
      $(element).css("-moz-border-radius", data.nifty_corner.border_radius + "px")
      $(element).css("-webkit-border-radius", data.nifty_corner.border_radius + "px")
      $(element).css("border-radius", data.nifty_corner.border_radius + "px")


