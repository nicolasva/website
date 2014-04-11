jQuery ->
  $(document).ready ->
    $(".container.content.margin-container").children().first().children().first().children().first().children().each (key, value) ->
      id_value_content = $(value).attr("id")
      if id_value_content.split("_")[0] == "content"
        uuid = $(value).attr("class").split(" ")[$(value).attr("class").split(" ").length - 1]
        $.getJSON("/contents/"+uuid+"/backgrounds", (data) ->
          unless _.isNull(data)
            $(value).css("background-color", data.background_color)
            $(value).css("background", "url('"+data.background_image.url+" "+ if data.no_repeat is true then  'no-repeat' else '' +"')") unless data.no_background_image
            $(value).css("border", data.border+" "+data.border_style+" "+data.border_color)
        )
