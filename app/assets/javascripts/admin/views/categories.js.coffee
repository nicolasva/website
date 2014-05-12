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
            content = $(value3).children().last().children().slice(-2).first() 
            annoncment = $(value3).children().last().children().last() 
            if $($(value3).children()[2]).children().first().is(':checked')
              $(value3).children().last().children().first().show()
              $($(value3).children()[3]).children().first().hide()
              $($(value3).children()[4]).children().first().hide()
              content.hide()
              annoncment.hide()
            else
              $(value3).children().last().children().first().hide()
              if $($(value3).children()[3]).children().first().children().filter(':selected').attr("value")
                content.show()
                annoncment.hide()
                #$(value3).children().last().append("<input class='btn btn-mini btn-warning' type='submit' value='Les contenus' name='content_list_category_title_test'>") unless $(value3).children().last().children().last().attr("value") == "Les contenus"
              else
                content.hide()
                annoncment.show()
                #$(value3).children().last().append("<input class='btn btn-mini btn-warning' type='submit' value='Les annonces' name='annoncment_list_category_title_sqdqsd'>") unless $(value3).children().last().children().last().attr("value") == "Les annonces"

  $(document).on "click", ".category_sub_menu", (e) ->
    content = $(e.target).parent().parent().children().last().children().slice(-2).first() 
    annoncment = $(e.target).parent().parent().children().last().children().last()
    if $(e.target).is(':checked')
      $(e.target).parent().parent().children().last().children().first().show()
      $($(e.target).parent().parent().children()[3]).children().first().hide()
      $($(e.target).parent().parent().children()[4]).children().first().hide()
      content.hide()
      annoncment.hide()
    else
      $(e.target).parent().parent().children().last().children().first().hide() 
      $($(e.target).parent().parent().children()[3]).children().first().show()
      $($(e.target).parent().parent().children()[4]).children().first().show()
      if $($(e.target).parent().parent().children()[3]).children().first().children().filter(':selected').attr("value")
        content.show()
        annoncment.hide()
      else
        content.hide()
        annoncment.show()

