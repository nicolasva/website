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
        unless data.background.no_background_image 
          $('.background_by_default').css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then 'no-repeat' else '')
          $('.background_by_default').css("background-position", HASH_ALIGN_CSS[data.background.align])
          if data.background.align == 11
            $('.background_by_default').css("background-size", "cover")
            $('.background_by_default').css("-moz-background-size", screen.width+"px" screen.height+"px")
            $('.background_by_default').css("-o-background-size", screen.width+"px" screen.height+"px")
            $('.background_by_default').css("-webkit-background-size", screen.width+"px" screen.height+"px")
            $('.background_by_default').css("background-size", screen.width+"px" screen.height+"px")
        $('.background_by_default').css("background-color", data.background.background_color)
        $(".background_by_default").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
    )

    $.getJSON("/menu_backgrounds", (data) ->
      unless _.isNull(data)
        unless data.background.no_background_image 
          $(".menu_color").css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then 'no-repeat' else '') 
          $('.menu_color').css("background-position", HASH_ALIGN_CSS[data.background.align]) 
          if data.background.align == 11
            $('.menu_color').css("background-size", "cover")
            $('.menu_color').css("-moz-background-size", screen.width+"px" screen.height+"px")
            $('.menu_color').css("-o-background-size", screen.width+"px" screen.height+"px")
            $('.menu_color').css("-webkit-background-size", screen.width+"px" screen.height+"px")
            $('.menu_color').css("background-size", screen.width+"px" screen.height+"px")
        $(".menu_color").css("background-color", data.background.background_color)
        $(".menu_color").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)

    )

    $.getJSON("/sub_menu_backgrounds", (data) ->
      unless _.isNull(data)
        unless data.background.no_background_image
          $(".sub_menu").css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then 'no-repeat' else '') 
          $('.sub_menu').css("background-position", HASH_ALIGN_CSS[data.background.align]) 
          if data.background.align == 11
            $('.sub_menu').css("background-size", "cover")
            $('.sub_menu').css("-moz-background-size", screen.width+"px" screen.height+"px")
            $('.sub_menu').css("-o-background-size", screen.width+"px" screen.height+"px")
            $('.sub_menu').css("-webkit-background-size", screen.width+"px" screen.height+"px")
            $('.sub_menu').css("background-size", screen.width+"px" screen.height+"px")
        $(".sub_menu").css("background-color", data.background.background_color)
        $(".sub_menu").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
    )


