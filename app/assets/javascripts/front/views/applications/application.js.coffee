jQuery ->
  $(document).ready ->
    $.getJSON("/background_by_defaults", (data) -> 
      unless _.isNull(data)
        unless data.background.no_background_image
          $('.background_by_default').css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true then 'no-repeat' else '' +"')")
        else
          $('.background_by_default').css("background-color", data.background.background_color)
        $(".background_by_default").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
    )

    $.getJSON("/menu_backgrounds", (data) ->
      unless _.isNull(data)
        unless data.background.no_background_image
          $(".menu_color").css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true then 'no-repeat' else '' +"')")
        else
          $(".menu_color").css("background-color", data.background.background_color)
        $(".menu_color").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)

    )

    $.getJSON("/sub_menu_backgrounds", (data) ->
      unless _.isNull(data)
        unless data.background.no_background_image
          $(".sub_menu").css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true then 'no-repeat' else '' +"')")
        else
          $(".sub_menu").css("background-color", data.background.background_color)
        $(".sub_menu").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
    )


