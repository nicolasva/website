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
          $('.background_by_default').css("background-size", "cover")
          if data.background.align == 11
            $('.background_by_default').css("-moz-background-size", screen.width screen.height)
            $('.background_by_default').css("-o-background-size", screen.width screen.height)
            $('.background_by_default').css("-webkit-background-size", screen.width screen.height)
            $('.background_by_default').css("background-size", screen.width screen.height)
        $('.background_by_default').css("background-color", data.background.background_color)
        $(".background_by_default").css("border", data.background.border+"px "+data.background.border_style+" "+data.background.border_color)
    )

    $.getJSON("/menu_backgrounds", (data) ->
      unless _.isNull(data)
        unless data.background.no_background_image
          console.log "true"
          $(".menu_color").css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then 'no-repeat' else '') 
          $('.menu_color').css("background-position", HASH_ALIGN_CSS[data.background.align]) 
          $('.menu_color').css("background-size", "cover") 
          if data.background.align == 11
            $(".menu_color").css("-moz-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $(".mdenu_color").css("-o-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $(".menu_color").css("-webkit-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $(".menu_color").css("background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
        $(".menu_color").css("background-color", data.background.background_color)
        $(".menu_color").css("border", data.background.border+"px "+data.background.border_style+" "+data.background.border_color)

    )

    $.getJSON("/sub_menu_backgrounds", (data) ->
      unless _.isNull(data)
        unless data.background.no_background_image
          $(".sub_menu").css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then 'no-repeat' else '') 
          $('.sub_menu').css("background-position", HASH_ALIGN_CSS[data.background.align]) 
          $('.sub_menu').css("background-size", "cover") 
          if data.background.align == 11
            $('.sub_menu').css("-moz-background-size", screen.width screen.height)
            $('.sub_menu').css("-o-background-size", screen.width screen.height)
            $('.sub_menu').css("-webkit-background-size", screen.width screen.height)
            $('.sub_menu').css("background-size", screen.width screen.height)
        $(".sub_menu").css("background-color", data.background.background_color)
        $(".sub_menu").css("border", data.background.border+"px "+data.background.border_style+" "+data.background.border_color)
    )

    $.getJSON("/header_backgrounds", (data) ->
      unless _.isNull(data)
        $("#id_header").show()
        unless data.background.no_background_image
          $('#id_header').css("background", "url('"+data.background.background_image.header.url+"') " + if data.background.no_repeat is true then 'no-repeat' else '')
          $('#id_header').css("background-position", HASH_ALIGN_CSS[data.background.align])
          $("#id_header").css("background-size", "cover")
          if data.background.align == 11
            $("#id_header").css("-moz-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $("#id_header").css("-o-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $("#id_header").css("-webkit-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $("#id_header").css("background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
        $("#id_header").css("background-color", data.background.background_color)
        console.log data.background.border+"px "+data.background.border_style+" "+data.background.border_color 
        $("#id_header").css("border", data.background.border+"px "+data.background.border_style+" "+data.background.border_color)
    )


