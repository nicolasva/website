jQuery ->
  $(document).ready ->
    location_href = window.location.href
    exp_footer_background_url = new RegExp("^.{1,}(footer_backgrounds).{1,}$","g")
    exp_footer_background_edit = new RegExp("^.{1,}(edit)$","g")

    if exp_footer_background_url.test(location_href) && exp_footer_background_edit.test(location_href) == false
      exp_footer_backgrounds = new RegExp("^.{1,}\/footer_backgrounds\/(.{1,})$","g")

      footer_backgrounds_uuid = exp_footer_backgrounds.exec(location_href)[1]
      $.getJSON("/admin/background_by_defaults/"+footer_backgrounds_uuid, (data) ->
        $(".background_by_default").css("background-color", data.background.background_color) if data.background.no_background_image
        $(".background_by_default").css("background", "url('"+data.background.background_image.url+"') "+ if data.background.no_repeat is true then + 'no-repeat' else '') unless data.background.no_background_image
        $(".background_by_default").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
      )
