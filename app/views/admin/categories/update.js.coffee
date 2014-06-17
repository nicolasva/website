$(".dialog_box").modal('hide')
if $("#category_<%= @category.id %>").html("<%= escape_javascript(render(:partial => '/admin/categories/show', :locals => { :category => @category })) %>")
  $(".category").each (key, value) ->
    $(value).children().each (key1, value1) ->
      console.log $(value)
      $(value1).children().each (key2, value2) ->
        $(value2).children().each (key2, value3) -> 
          content = $(value3).children().last().children().slice(-3).first() 
          annoncment = $(value3).children().last().children().slice(-2).first()
          image_galery = $(value3).children().last().children().last()
          if $($(value3).children()[2]).children().first().is(':checked')
            $(value3).children().last().children().first().show()
            $($(value3).children()[3]).children().first().hide()
            $($(value3).children()[4]).children().first().hide()
            content.hide()
            annoncment.hide()
            image_galery.hide()
          else
            $(value3).children().last().children().first().hide()
            switch parseInt($($(value3).children()[3]).children().first().children().filter(':selected').attr("value"))
              when 0
                content.hide()
                image_galery.hide()
                annoncment.show()
              when 1
                content.show()
                annoncment.hide()
                image_galery.hide()
              when 2
                content.hide()
                annoncment.hide()
                image_galery.show()
