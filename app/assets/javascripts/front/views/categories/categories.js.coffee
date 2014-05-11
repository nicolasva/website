jQuery ->
  $(document).ready ->
    if $(".menu_color").children().first().children().last().children().first().children().length > 0
      $(".menu_color").children().first().children().last().children().first().children().each (key, value) ->
        category_id = $(value).attr("class").split("_")[$(value).attr("id").split("_").length-1]
        $.ajax({
          url: "/categories/"+category_id
          type: "GET"
          dataType: "json"
          success: (val) ->
            unless _.isNull(val)
              $(value).children().first().css("color", val.color_font)
          error: ->
            alert("Error load personalize category")
        })
