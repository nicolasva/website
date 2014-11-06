HASH_FONT_FAMILY_HEADER_BACKGROUND_CSS =
  0: ""
  1: "Arial, helvetica, sans-serif"
  2: "comic sans ms, cursive"
  3: "courier new, courier, monospace"
  4: "georgia, serif"
  5: "lucida sans unicode, lucida grande, sans-serif"
  6: "tahoma, geneva,sans-serif"
  7: "times new roman,times,serif"
  8: "trebuchet ms,helvetica,sans-serif"
  9: "verdana,geneva,sans-serif"

HASH_TEXT_DECORATION_HEADER_BACKGROUND_CSS =
  0: "none"
  1: "overline"
  2: "line-through"
  3: "blink"

HASH_ALIGN_HEADER_BACKGROUND_CSS = 
  0: ""
  1: "center"
  2: "left"
  3: "right"
  4: "justify"
  5: "inherit"

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
    $("#id_button_search").popover('hide')
    location_href = window.location.href
    $.getJSON("/background_by_defaults", (data) -> 
      unless _.isNull(data)
        set_properties_css(".background_by_default", data.background)
        set_propertie_full_screen_javascript(".content", data.background.align)
    )

    $.getJSON("/menu_backgrounds", (data) ->
      unless _.isNull(data)
        set_properties_css(".menu_color", data.background)
        $(".category").css("margin-right", data.margin_right+"px") 
        #$(".category").css("font-size", data.font.font_size+"pt")
        #$(".category").css("font-family", HASH_FONT_FAMILY_HEADER_BACKGROUND_CSS[data.font.font_family])
        set_font_family_css($(".category"), data.font)
        set_propertie_full_screen_javascript(".menu_color", data.background.align)
    )

    $.getJSON("/sub_menu_backgrounds", (data) ->
      unless _.isNull(data)
        set_properties_css($(".sub_menu"), data.background) 
        set_propertie_full_screen_javascript(".sub_menu", data.background.align)
        $(".sub_menu").each (key, value) ->
          $(value).children().each (key, value) ->
            set_font_family_css($(value), data.font)
            #$(value).css("font-size", data.font.font_size+"pt")
            #$(value).css("font-family", HASH_FONT_FAMILY_HEADER_BACKGROUND_CSS[data.font.font_family])
    )

    $.getJSON("/header_backgrounds", (data) ->
      unless _.isNull(data)
        $("#id_header").show()
        if !_.isNull(data.watch_title) && data.watch_title
          if data.text_or_image
            $("#id_header").css("color", data.font_color_title)
            $("#id_header").css("font-family", HASH_FONT_FAMILY_HEADER_BACKGROUND_CSS[data.font_family_title])
            $("#id_header").css("text-decoration", HASH_TEXT_DECORATION_HEADER_BACKGROUND_CSS[data.text_decoration]) 
            $("#id_header").css("font-size", data.size_title+"pt")
          $("#id_header").css("text-align", HASH_ALIGN_HEADER_BACKGROUND_CSS[data.align_title])
        set_properties_css("#id_header", data.background) 
        set_propertie_full_screen_javascript("#id_header", data.background.align)
    )

    regex_for_menu = new RegExp("^.{1,}categories\/(.{1,})\/.{1,}$","g")
    if _.isEmpty(location_href.scan(regex_for_menu))
      if ("#content_list").length > 0
        $.getJSON("/categories_sub_menus", (data) ->
          unless _.isNull(data)
            $.getJSON("/menu_backgrounds", (data_menu_background) ->
              click_button("#category_#{data.id}", _.isNull(data_menu_background), data_menu_background.click_link)
            )
            $.each(data.submenus, (key, val) ->
              unless _.isUndefined(val.homepage_submenu)

                $.getJSON("/sub_menu_backgrounds", (data_sub_menu_background) -> 
                  click_button("._#{val.title}", _.isNull(data), data_sub_menu_background.click_link)
                )
            )
        )
    else
      if $("#content_list").length > 0 && !_.isUndefined($("#content_list").children().first().attr("class"))
        content_uuid = $("#content_list").children().first().attr("class").split(" ").slice(2)[0]
        $("#content_list").children().first()
        $.getJSON("/categories_sub_menus/"+content_uuid, (data) ->
          unless _.isNull(data)
            if data.category
              $.getJSON("/menu_backgrounds", (data_menu_background) ->  
                click_button("#category_#{data.id}", _.isNull(data_menu_background), data_menu_background.click_link)
              )
            else
              $.getJSON("/menu_backgrounds", (data_menu_background) -> 
                click_button("#category_#{data.submenu.category.id}", _.isNull(data_menu_background), data_menu_background.click_link)
              )

              $.getJSON("/sub_menu_backgrounds", (data_sub_menu_background) -> 
                click_button("._#{data.submenu.title}", _.isNull(data), data_sub_menu_background.click_link)
              )
        )
      if $("#annoncment_list").length > 0 && !_.isUndefined($("#annoncment_list").children().first().attr("id"))
        annoncment_id = $("#annoncment_list").children().first().attr("id").split("_").slice(1)[0]
        $.getJSON("/categories_sub_menus_annoncments/"+annoncment_id, (data) -> 
          unless _.isNull(data)
            if data.category
              $.getJSON("/menu_backgrounds", (data_menu_background) -> 
                click_button("#category_#{data.category.id}", _.isNull(data_menu_background), data_menu_background.click_link)
              )
            else
              $.getJSON("/sub_menu_backgrounds", (data_sub_menu_background) -> 
                click_button("._#{data.submenu.title}", _.isNull(data_sub_menu_background), data_sub_menu_background.click_link)
              )
              $.getJSON("/menu_backgrounds", (data_menu_background) -> 
                click_button("#category_#{data.submenu.category.id}", _.isNull(data_menu_background), data_menu_background.click_link)
              )
        )
      if $("#Galery_photo").length > 0 && !_.isUndefined($("#Galery_photo").children().first().attr("id"))
        galery_photo_id = $("#Galery_photo").children().first().attr("id").split("_").slice(2)[0]
        $.getJSON("/categories_sub_menus_galery_photos/"+galery_photo_id, (data) ->
          unless _.isNull(data)
            if data.category
              $.getJSON("/menu_backgrounds", (data_menu_background) ->
                click_button("#category_#{data.category.id}", _.isNull(data_menu_background), data_menu_background.click_link)
              )
            else
              $.getJSON("/sub_menu_backgrounds", (data_sub_menu_background) -> 
                click_button("._#{data.submenu.title}", _.isNull(data_sub_menu_background), data_sub_menu_background.click_link)
              )
              $.getJSON("/menu_backgrounds", (data_menu_background) ->
                click_button("#category_#{data.submenu.category.id}", _.isNull(data_menu_background), data_menu_background.click_link)
              )
        )



    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")

    if exp_annoncment.test(location_href) && !_.isEmpty($("#annoncment_list")) 
      $.getJSON("/personalize_backgrounds", (data) ->
        unless _.isNull(data)
          $("#annoncment_list").children().css("margin-top", data.margin_top+"%")
          $("#annoncment_list").find("a").css("color", data.font_color)
          $("#annoncment_list").css("height", window.screen.height) if data.height_screen.height
          set_nifty_corner("#annoncment_list", data)
          set_properties_css("#annoncment_list", data.background)
      )

click_button = (element, data_menu_background, click_link) ->
  unless data_menu_background
    #click_link.color
    $(element).css("background-color", click_link.background_color)
    $(element).css("color", click_link.color)
  else
    $(element).css("background-color", "silver")
    $(element).css("color", "black")

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
    $(element).css("background", "url('"+background_image_size(background.background_image, background.background_image_size)+"') " + if background.no_repeat is true then 'no-repeat' else 'repeat') unless background.no_background_image || _.isNull(background.background_image.url)
    $(element).css("background-position", HASH_ALIGN_CSS[background.align]) 
    $(element).css("background-size", "cover") if background.cover
    $(element).css("opacity", background.opacity)
    if background.align == 11
      height = $('#id_header').css("height")
      width = $('#id_header').css("width")
      $(element).css("-moz-background-size", width+" "+height)
      $(element).css("-o-background-size", width+" "+height)
      $(element).css("-webkit-background-size", width+" "+height)
      $(element).css("background-size", width+" "+height)
  height_header = parseInt($('#id_header').css("height").scan(new RegExp("^(.{1,})(px)$","g"))[0][0])+30+"px"
  $(element).height("height", height_header)
  $(element).css("background-color", if background.transparent is true then "transparent" else background.background_color)
  $(element).css("border", background.border+"px "+background.border_style+" "+background.border_color)

set_font_family_css = (element, font) ->
  element.css("font-size", font.font_size+"pt")
  element.css("font-family", HASH_FONT_FAMILY_HEADER_BACKGROUND_CSS[font.font_family])

background_image_size = (background_image, background_image_size) ->
  switch background_image_size
    when 0
      return background_image.url
    when 1
      return background_image.thumb.url
    when 2
      return background_image.header.url

