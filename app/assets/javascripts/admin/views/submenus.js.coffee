jQuery ->
  $(document).on 'change', '.content_or_annoncment', (e) ->
    location_href = window.location.href
    regex_subemnus = new RegExp("^.{1,}\/(submenus)$","g")
    if regex_subemnus.test(location_href)
      submenu_title = $(e.target).parent().parent().children().last().children().last().attr("name").split("_").slice(-1)[0]
      #$(e.target).parent().parent().children().last().children().last().remove()
      id_for_add_button = $(e.target).parent().parent().children().last() 
      content = id_for_add_button.children().slice(-3).first()
      annoncment = id_for_add_button.children().slice(-2).first()
      image_galery = id_for_add_button.children().last()
      switch parseInt($(e.target).val())
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

jQuery ->
  $("#ColorFontSubmenu").ColorPicker({
    color: $('#ColorFontSubmenu').children().first().css("background-color")
  })
jQuery ->
  $(document).ready ->
    regex_for_get_category = new RegExp("^.{1,}categories\/(.{1,})\/.{1,}$","g")
    regex_page_submenu = new RegExp("^.{1,}submenus$","g")
    if regex_page_submenu.test(window.location.href)
      title_category = regex_for_get_category.exec(window.location.href).slice(-1)
      $(".submenus_list").sortable({
        items: '.submenu'
        update: ->
          $.ajax({
            url: "/admin/categories/"+title_category+"/submenus/sort",
            type: "GET",
            data: $(this).sortable('serialize'),
            failure: ->
              alert("Problem sortable list")
          })
      })

    $(".submenus_list").children().each (key, value) ->
      $(value).children().each (key, value_1) ->
        $(value_1).children().each (key, value_2) ->
          #$(value_2).first().children().first().children().last().children().each (key, value_3) ->
          #console.log $(value_3)
          content = $(value_2).first().children().first().children().last().children().slice(-3).first()
          annoncment = $(value_2).first().children().first().children().last().children().slice(-2).first()
          image_galery = $(value_2).first().children().first().children().last().children().last()
          switch parseInt($(value_2).first().children().first().children().slice(-3).first().children().first().children().filter(':selected').attr("value"))
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
