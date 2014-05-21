jQuery ->
  $(document).ready ->
    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")
    location_href  = window.location.href

    if exp_annoncment.test(location_href)
      $(".annoncment").each (key, value) ->
        annoncment_id = $(value).attr("class").split(" ").slice(-1)[0].split("_").slice(-1)[0]
        $.getJSON("/annoncments/"+annoncment_id+"/backgrounds", (data) ->
          unless _.isNull(data)
            $(".annoncment").css("background-color", data.background_color)
            $(".annoncment").css("background", "url('"+data.background_image.url+"') "+ if data.no_repeat is true then 'no-repeat' else '') unless data.no_background_image
            $(".annoncment").css("border", data.border+" "+data.border_style+" "+data.border_color)
        )
