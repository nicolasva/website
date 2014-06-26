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
    $(".container.content.margin-container").children().first().children().first().children().first().children().each (key, value) ->
      id_value_content = $(value).attr("id")
      if id_value_content.split("_")[0] == "content"
        uuid = $(value).attr("class").split(" ")[$(value).attr("class").split(" ").length - 1]
        $.getJSON("/contents/"+uuid, (data) ->
          unless _.isNull(data)
            #console.log $(value)
            $(value).css("height", window.screen.height + "px") if data.height_screen.height
            unless _.isUndefined(data.nifty_corner)
              if data.nifty_corner.nifty_corner
                $(value).css("-moz-border-radius", data.nifty_corner.border_radius + "px")
                $(value).css("-webkit-border-radius", data.nifty_corner.border_radius + "px")
                $(value).css("border-radius", data.nifty_corner.border_radius + "px")

            set_properties_css(value, data.background)
            set_propertie_full_screen_javascript(value, data.background.align)
            #$(value).css("background-color", data.background.background_color)
            #$(value).css("background", "url('"+data.background.background_image.url+"') "+ if data.background.no_repeat is true then  'no-repeat' else '') unless data.background.no_background_image
            #$(value).css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
        )

set_propertie_full_screen_javascript = (element, align) ->
  if align == 12
    winwidth = $(window).width()
    winheight = $(window).height()
    $(element).css("height", winheight + "px")
    $(element).css("width", winwidth + "px")

set_properties_css = (element, background) ->
  unless background.no_background_image || _.isNull(background.background_image.thumb.url)
    $(element).css("background", "url('"+background_image_size(background.background_image, background.background_image_size)+"') " + if background.no_repeat is true then 'no-repeat' else 'repeat')
    $(element).css("background-position", HASH_ALIGN_CSS[background.align]) 
    $(element).css("background-size", "cover") if background.cover
    if background.align == 11
      $(element).css("-moz-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
      $(element).css("-o-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
      $(element).css("-webkit-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
      $(element).css("background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
  $(element).css("background-color", background.background_color)
  $(element).css("border", background.border+"px "+background.border_style+" "+background.border_color)

background_image_size = (background_image, background_image_size) ->
  switch background_image_size
    when 0
      return background_image.url
    when 1
      return background_image.thumb.url
    when 2
      return background_image.header.url
