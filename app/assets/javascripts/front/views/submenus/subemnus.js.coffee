jQuery ->
  $(document).ready ->
    if $(".menu_color").children().first().children().last().children().first().children().length > 0
      $(".menu_color").children().first().children().last().children().first().children().each (key, value) ->
        regex_on_element_category = new RegExp("^category _(.{1,})$", "g")
        category_title = $(value).attr("class").scan(regex_on_element_category)[0][0]
        if parseInt($(value).children().length) == 2
          $(value).children().last().children().each (key, value_submenu) ->
            regex_on_element_submenu = new RegExp("^submenu _(.{1,})$","g")
            submenu_title = $(value_submenu).attr("class").scan(regex_on_element_submenu)[0][0]
            $.ajax({
              url: "/categories/#{category_title}/submenus/#{submenu_title}"
              type: "GET"
              dataType: "json"
              success: (val) ->
                $(value_submenu).children().first().css("color", val.color_font)
              error: ->
                alert("Error load personalize font color submenu")
            })
