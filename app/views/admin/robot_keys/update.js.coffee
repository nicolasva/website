$(".dialog_box").modal('hide')
$("#robot_key_<%= @robot_key.id %>").html("<%= escape_javascript(render(:partial => '/admin/robot_keys/td_list_robot_keys', :locals => { :robot_key => @robot_key})) %>")
