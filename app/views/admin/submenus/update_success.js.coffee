$(".submenus_list").children().each (key, value) ->
  if _.isEqual($(value).attr("id").split("_")[$(value).attr("id").split("_").length - 1], "<%= @submenu_id %>")
    $(value).html("<%= escape_javascript(render(:partial => '/admin/submenus/show', :locals => { :submenu => @submenu})) %>")
$(".dialog_box").modal("hide")

