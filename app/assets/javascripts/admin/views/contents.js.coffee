jQuery ->
  $('#colorSelector').ColorPicker({
    color: $("#colorSelector").children().first().css("background-color"),
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false
    onChange: (hsb, hex, rgb) ->
      $('#colorSelector div').css('backgroundColor', '#' + hex)
      console.log $(".class_border_color").attr("value", '#' + hex)
  })

jQuery ->
  $(document).on  'click', '.grid_button_not_delete', (e) ->
    $(".input_delete_backgorund_image").attr("value", true)
    $(e.target).hide()
    $(".grid_button_delete").show()
    return false

jQuery ->
  $(document).on  'click', '.grid_button_delete', (e) ->
    $(".input_delete_backgorund_image").attr("value", false)
    $(e.target).hide()
    $(".grid_button_not_delete").show()
    return false

jQuery ->
  $(document).ready -> 
    $(".contents_list").sortable({
      items: '.content'
      update: ->
        $.ajax({
          url: "/admin/categories/"+$(".container").last().children().first().children().first().children().last().attr("href").split("/")[3]+"/contents/sort",
          type: "GET",
          data: $(this).sortable('serialize'),
          failure: ->
            alert("Problem sortable list")
        })
    })

    exp_content = new RegExp("^.{1,}(contents).{1,}$","g")
    exp_edit = new RegExp("^.{1,}(edit)$","g")
    location_href = window.location.href 

    if exp_content.test(location_href) && exp_edit.test(location_href) == false
      exp_category = new RegExp("^.{1,}\/categories\/(.{1,})\/contents.{1,}$","g")
      category_id = exp_category.exec(location_href)[1]

      exp_content_id = new RegExp("^.{1,}\/contents\/(.{1,})$","g")
      content_id = exp_content_id.exec(location_href)[1]

      $.getJSON("/admin/categories/"+category_id+"/contents/"+content_id, (data) ->
        $(".content_description").css("background-color", data.background_color)
        $(".content_description").css("background", "url('"+data.background_image.url+"') "+ if data.no_repeat is true then + 'no-repeat' else '') unless data.no_background_image
        $(".content_description").css("border", data.border+" "+data.border_style+" "+data.border_color)
      )
    else
      if $("#content_no_background_image").length > 0
        value_no_background_image = $("#content_no_background_image").attr("value")
        if $('#content_no_background_image').is(':checked') is true then $(".background_image").hide() else $(".background_image").show()

jQuery ->
  $(document).on 'change', '.content_or_annoncment', (e) ->   
    location_href = window.location.href
    regex_categories = new RegExp("^.{1,}\/(categories)$","g")
    if regex_categories.test(location_href)
      category_title = $(e.target).parent().parent().children().last().children().last().attr("name").split("_").slice(-1)[0]
      #$(e.target).parent().parent().children().last().children().last().remove() 
      #console.log $(e.target).parent().parent().children().last().children().last()
      id_for_add_button = $(e.target).parent().parent().children().last()
      content = id_for_add_button.children().slice(-3).first()
      annoncment = id_for_add_button.children().slice(-2).first()
      image_galery = id_for_add_button.children().last()
      switch parseInt($(e.target).val()) 
        when 0
          #id_for_add_button.append("<input class='btn btn-mini btn-warning' type='submit' value='Les annonces' name='annoncment_list_category_title_"+category_title+"'>")
          content.hide()
          image_galery.hide()
          annoncment.show()
        when 1
          #id_for_add_button.append("<input class='btn btn-mini btn-warning' type='submit' value='Les contenus' name='content_list_category_title_"+category_title+"'>")
          content.show()
          annoncment.hide()
          image_galery.hide()
        when 2
          content.hide()
          annoncment.hide()
          image_galery.show()


