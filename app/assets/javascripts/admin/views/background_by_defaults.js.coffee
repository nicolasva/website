jQuery ->
  $(document).ready -> 
    location_href = window.location.href
    exp_background_by_default_url = new RegExp("^.{1,}(background_by_defaults).{1,}$","g")
    exp_background_by_default_edit = new RegExp("^.{1,}(edit)$","g")

    if exp_background_by_default_url.test(location_href) && exp_background_by_default_edit.test(location_href) == false
      exp_background_by_defaults = new RegExp("^.{1,}\/background_by_defaults\/(.{1,})$","g")

      background_by_defaults_uuid = exp_background_by_defaults.exec(location_href)[1]
      $.getJSON("/admin/background_by_defaults/"+background_by_defaults_uuid, (data) ->
        unless _.isNull(data)
          $(".background_by_default").css("background-color", data.background.background_color)
          $(".background_by_default").css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true then 'no-repeat' else '' +"')") unless data.background.no_background_image
          $(".background_by_default").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
      )
