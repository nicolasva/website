$(".dialog_box").modal('hide')
$("#title_website").children().last().append("<%= escape_javascript(render(:partial => '/admin/title_websites/td_list_title_website', :locals => { :title_website => @title_website})) %>")
