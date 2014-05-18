jQuery ->
  $(document).ready ->
    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")
    location_href = window.location.href

    if exp_annoncment.test(location_href)
      $.getJSON("/personalize_backgrounds", (data) ->
        unless _.isNull(data)
          $("#annoncment_list").find("a").css("color", data.background)
          set_properties_css("#annoncment_list", data.background)
      )
