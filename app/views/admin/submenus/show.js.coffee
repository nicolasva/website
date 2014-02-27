$(".dialog_box").modal("hide")
$(".submenus_list").append("<%= escape_javascript(render(:partial => '/admin/submenus/show', :locals => { :submenu => @submenu})) %>")
