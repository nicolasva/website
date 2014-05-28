$(".dialog_box").modal('hide')
$(".robot_keys").children().last().append("<%= escape_javascript(render(:partial => '/admin/robot_keys/list_robot_keys', :locals => { :robot_key => @robot_key })) %>")


