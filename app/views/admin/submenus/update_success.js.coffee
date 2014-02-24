$(".submenus_list").children().each (key, value) ->
  if _.isEqual($(value).attr("id").split("_")[$(value).attr("id").split("_").length - 1], "<%= @submenu_id %>")
    $(value).html("<%= escape_javascript(render(:partial => 'update_success')) %>")
$(".dialog_box").modal("hide")

