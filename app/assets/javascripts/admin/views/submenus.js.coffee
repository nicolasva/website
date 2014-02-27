jQuery ->
  $(document).on 'change', '.content_or_annoncment', (e) ->
    submenu_title = $(e.target).parent().parent().children().last().children().last().attr("name").split("_").slice(-1)[0]
    $(e.target).parent().parent().children().last().children().last().remove()
    id_for_add_button = $(e.target).parent().parent().children().last()
    if $(e.target).val() == 'true'
      id_for_add_button.append("<input class='btn btn-mini btn-warning' type='submit' value='Les contenus' name='content_list_submenu_title_"+submenu_title+"'>")
    else
      id_for_add_button.append("<input class='btn btn-mini btn-warning' type='submit' value='Les annonces' name='annoncment_list_submenu_title_"+submenu_title+"'>")
