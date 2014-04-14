$(document).ready ->
  location_href = window.location.href
  exp_header_background_url = new RegExp("^.{1,}(header_backgrounds).{1,}$","g")
  exp_header_background_edit = new RegExp("^.{1,}(edit)$","g")

  if exp_header_background_url.test(location_href) && exp_header_background_edit.test(location_href) == false 
    exp_header_backgrounds = new RegExp("^.{1,}\/header_backgrounds\/(.{1,})$","g")

    header_backgrounds_uuid = exp_header_backgrounds.exec(location_href)[1]
    $.getJSON("/admin/header_backgrounds/"+header_backgrounds_uuid, (data) -> 
      console.log $(".header_background").css("background-color", data.background.background_color)
      $(".header_background").css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then + 'no-repeat' else '') unless data.background.no_background_image
      $(".header_background").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
    )
