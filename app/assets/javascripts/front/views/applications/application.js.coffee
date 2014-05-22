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

jQuery ->
  $(document).ready ->
    $.getJSON("/background_by_defaults", (data) -> 
      unless _.isNull(data)
        set_properties_css(".background_by_default", data.background)
        set_propertie_full_screen_javascript(".content", data.background.align)
    )

    $.getJSON("/menu_backgrounds", (data) ->
      unless _.isNull(data)
        set_properties_css(".menu_color", data.background) 
        set_propertie_full_screen_javascript(".menu_color", data.background.align)
    )

    $.getJSON("/sub_menu_backgrounds", (data) ->
      unless _.isNull(data)
        set_properties_css(".sub_menu", data.background) 
        set_propertie_full_screen_javascript(".sub_menu", data.background.align)
    )

    $.getJSON("/header_backgrounds", (data) ->
      unless _.isNull(data)
        $("#id_header").show()
        set_properties_css("#id_header", data.background) 
        set_propertie_full_screen_javascript("#id_header", data.background.align)
    )

    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")
    location_href = window.location.href

    if exp_annoncment.test(location_href)
      $.getJSON("/personalize_backgrounds", (data) ->
        unless _.isNull(data)
          $("#annoncment_list").children().css("margin-top", data.margin_top+"%")
          $("#annoncment_list").find("a").css("color", data.font_color)
          set_properties_css("#annoncment_list", data.background)
      )

set_propertie_full_screen_javascript = (element, align) ->
  if align == 12
    winwidth = $(window).width()
    winheight = $(window).height()
    $(element).css("height", winheight + "px")
    $(element).css("width", winwidth + "px")

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
