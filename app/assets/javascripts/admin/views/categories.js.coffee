jQuery ->
  $(document).ready ->
    $(".category_list").sortable({
      items: '.category'
      update: ->
        $.ajax({
          url: "/admin/categories/sort",
          type: "GET",
          data: $(this).sortable('serialize'),
          failure: ->
            alert("Problem sortable list")
        })
    })

  $(document).ready ->
    $(".category").each (key, value) ->
      $(value).children().each (key1, value1) ->
        $(value1).children().each (key2, value2) ->
          $(value2).children().each (key2, value3) ->
            if $($(value3).children()[2]).children().first().is(':checked')
              $(value3).children().last().children().first().show()
            else
              $(value3).children().last().children().first().hide()
              if $($(value3).children()[3]).children().first().children().filter(':selected').attr("value")  
                $(value3).children().last().append("<input class='btn btn-mini btn-warning' type='submit' value='Les contenus' name='content_list_category_title_test'>") unless $(value3).children().last().children().last().attr("value") == "Les contenus"
              else
                $(value3).children().last().append("<input class='btn btn-mini btn-warning' type='submit' value='Les annonces' name='annoncment_list_category_title_sqdqsd'>") unless $(value3).children().last().children().last().attr("value") == "Les annonces"
        #$(value1).parent().each (key2, value2) ->
        #  console.log $(value2)

  $(document).bind "click", ".category_sub_menu", (e) ->
    if $(e.target).is(':checked') 
      $(e.target).parent().parent().children().last().children().first().show()
    else
      $(e.target).parent().parent().children().last().children().first().hide()
