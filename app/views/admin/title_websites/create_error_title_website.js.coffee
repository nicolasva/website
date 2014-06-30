$(".modal-body").prepend("<%= escape_javascript(render(:partial => '/admin/title_websites/create_error_title_website', :locals => { :notice => @notice}))")
