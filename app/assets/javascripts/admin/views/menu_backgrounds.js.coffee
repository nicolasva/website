jQuery ->
  $(document).ready -> 
    location_href = window.location.href
    exp_menu_backgrounds_url = new RegExp("^.{1,}\/(menu_backgrounds)\/.{1,}$","g")
    exp_menu_background_edit = new RegExp("^.{1,}(edit)$","g")

    if exp_menu_backgrounds_url.test(location_href) && exp_menu_background_edit.test(location_href) == false
      exp_menu_backgrounds = new RegExp("^.{1,}\/menu_backgrounds\/(.{1,})$","g")

      menu_backgrounds_uuid = exp_menu_backgrounds.exec(location_href)[1]
      $.getJSON("/admin/menu_backgrounds/"+menu_backgrounds_uuid, (data) ->
        $(".menu_background").css("background-color", data.background.background_color)
        $(".menu_background").css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true then + 'no_repeat' else '' +"')") unless data.background.no_background_image
        $(".menu_background").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
      )
