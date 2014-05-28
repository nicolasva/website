$(".modal-body").prepend("<%= escape_javascript(render(:partial => '/admin/robot_keys/create_error_robot_key', :locals => { :notice => @notice}))")
