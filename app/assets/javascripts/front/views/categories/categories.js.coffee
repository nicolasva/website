jQuery ->
  $(document).ready ->
    if $(".menu_color").children().first().children().last().children().first().children().first().children().length > 0
      $(".menu_color").children().first().children().last().children().first().children().first().children().each (key, value) ->
        #category_id = $(value).attr("class").split("_")[$(value).attr("id").split("_").length-1]
        regex_on_element_category = new RegExp("^category _(.{1,})$", "g")
        category_title = $(value).attr("class").scan(regex_on_element_category)[0][0]
        $.ajax({
          url: "/categories/"+category_title
          type: "GET"
          dataType: "json"
          success: (val) ->
            unless _.isNull(val)
              $(value).children().first().css("color", val.color_font)
          error: ->
            alert("Error load personalize category")
        })
