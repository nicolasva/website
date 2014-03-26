jQuery ->
  $(document).ready ->
    $.getJSON("/background_by_defaults", (data) -> 
      unless data.background.no_background_image
        $('.background_by_default').css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true + 'no_repeat' else '' +"')")
      else
        $('.background_by_default').css("background-color", data.background.background_color)
      $(".background_by_default").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
    )
