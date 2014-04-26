jQuery ->
  $(document).ready ->
    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")
    location_href  = window.location.href

    if exp_annoncment.test(location_href) 
      $.getJSON("/annoncments/"+$(".annoncment").children().first().html()+"/backgrounds", (data) ->
        console.log "nicolas oups"
        unless _.isNull(data)
          $(".annoncment").css("background-color", data.background_color)
          $(".annoncment").css("background", "url('"+data.background_image.url+"') "+ if data.no_repeat is true then 'no-repeat' else '') unless data.no_background_image
          $(".annoncment").css("border", data.border+" "+data.border_style+" "+data.border_color)
      )
