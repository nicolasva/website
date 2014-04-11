jQuery ->
  $(document).ready ->
    unless location.href.split("/")[location.href.split("/").length - 1] == "annoncments"
      $("#content_list").children().each (key, value) ->
        $.ajax({
          url: "/contents/#{$(value).attr('id').split('_')[1]}"
          type: "GET"
          dataType: "json"
          success: (val) ->
            height_paragraph_content = $(value).children().last().css("height")
            exp_get_height_paragraph = new RegExp("^(.{1,})px$","g")
            value_height_paragraph = parseFloat(exp_get_height_paragraph.exec("19px")[1])
            $(value).css("height", "#{value_height_paragraph + 1}px")
            $(value).css("border", "#{val.border} px #{val.border_style} #{val.border_color}")
            if val.no_background_image
              $(value).css("background-color", val.background_color)
            else
              $(value).css("background-image", "url(#{val.background_image})")
              $(value).css("background-repeat", if value.no_repeat is true then "no-repeat" else "repeat")
          error: ->
            alert("error load personnalize contents")
        })
