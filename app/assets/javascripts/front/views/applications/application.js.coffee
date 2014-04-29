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

jQuery ->
  $(document).ready ->
    $.getJSON("/background_by_defaults", (data) -> 
      unless _.isNull(data)
        set_properties_css(".background_by_default", data.background)
    )

    $.getJSON("/menu_backgrounds", (data) ->
      unless _.isNull(data)
        set_properties_css(".menu_color", data.background)
    )

    $.getJSON("/sub_menu_backgrounds", (data) ->
      unless _.isNull(data)
        set_properties_css(".sub_menu", data.background)
    )

    $.getJSON("/header_backgrounds", (data) ->
      unless _.isNull(data)
        $("#id_header").show()
        set_properties_css("#id_header", data.background)
    )

set_properties_css = (element, background) ->
  unless background.no_background_image
    $(element).css("background", "url('"+background.background_image.header.url+"') " + if background.no_repeat is true then 'no-repeat' else '')
    $(element).css("background-position", HASH_ALIGN_CSS[background.align])
    $(element).css("background-size", "cover")
    if background.align == 11
      $(element).css("-moz-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
      $(element).css("-o-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
      $(element).css("-webkit-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
      $(element).css("background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
  $(element).css("background-color", background.background_color)
  $(element).css("border", background.border+"px "+background.border_style+" "+background.border_color)
