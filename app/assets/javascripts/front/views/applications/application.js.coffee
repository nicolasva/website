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
    location_href = window.location.href
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

    regex_for_menu = new RegExp("^.{1,}categories\/(.{1,})\/.{1,}$","g")
    if _.isEmpty(location_href.scan(regex_for_menu))
      if ("#content_list").length > 0
        $.getJSON("/categories_sub_menus", (data) ->
          unless _.isNull(data)
            $("#category_#{data.id}").css("background-color", "silver")
            $.each(data.submenus, (key, val) ->
              unless _.isUndefined(val.homepage_submenu)
                $("._#{val.title}").css("background-color", "silver")
            )
        )
    else
      if $("#content_list").length > 0
        content_uuid = $("#content_list").children().first().attr("class").split(" ").slice(2)[0]
        #content_uuid = 
        $.getJSON("/categories_sub_menus/"+content_uuid, (data) ->
          unless _.isNull(data)
            if data.category
              $("#category_#{data.category.id}").css("background-color", "silver")
            else
              $("._#{data.submenu.title}").css("background-color", "silver")
              $("#category_#{data.id}").css("background-color", "silver")
        )
      if $("#annoncment_list").length > 0
        annoncment_id = $("#annoncment_list").children().first().attr("id").split("_").slice(1)[0]
        $.getJSON("/categories_sub_menus_annoncments/"+annoncment_id, (data) -> 
          unless _.isNull(data)
            if data.category
              $("#category_#{data.category.id}").css("background-color", "silver")
            else
              $("._#{data.submenu.title}").css("background-color", "silver")
              $("#category_#{data.id}").css("background-color", "silver")
        )
      if $("#Galery_photo").length > 0
        galery_photo_id = $("#Galery_photo").children().first().attr("id").split("_").slice(2)[0]
        $.getJSON("/categories_sub_menus_galery_photos/"+galery_photo_id, (data) ->
          unless _.isNull(data)
            if data.category
              $("#category_#{data.category.id}").css("background-color", "silver")
            else
              $("._#{data.submenu.title}").css("background-color", "silver")
              $("#category_#{data.id}").css("background-color", "silver")
        )



    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")

    if exp_annoncment.test(location_href)
      $.getJSON("/personalize_backgrounds", (data) ->
        unless _.isNull(data)
          $("#annoncment_list").children().css("margin-top", data.margin_top+"%")
          $("#annoncment_list").find("a").css("color", data.font_color)
          $("#annoncment_list").css("height", window.screen.height) if data.height_screen.height
          set_nifty_corner("#annoncment_list", data)
          set_properties_css("#annoncment_list", data.background)
      )

set_nifty_corner = (element, data) ->
  unless _.isUndefined(data.nifty_corner)
    if data.nifty_corner.nifty_corner
      $("#annoncment_list").css("-moz-border-radius", data.nifty_corner.border_radius + "px")
      $("#annoncment_list").css("-webkit-border-radius", data.nifty_corner.border_radius + "px")
      $("#annoncment_list").css("border-radius", data.nifty_corner.border_radius + "px")

set_propertie_full_screen_javascript = (element, align) ->
  if align == 12
    winwidth = $(window).width()
    winheight = $(window).height()
    $(element).css("height", winheight + "px")
    $(element).css("width", winwidth + "px")

set_properties_css = (element, background) ->
  unless background.no_background_image
    $(element).css("background", "url('"+background_image_size(background.background_image, background.background_image_size)+"') " + if background.no_repeat is true then 'no-repeat' else 'repeat')
    $(element).css("background-position", HASH_ALIGN_CSS[background.align]) 
    $(element).css("background-size", "cover") if background.cover
    $(element).css("opacity", background.opacity)
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

