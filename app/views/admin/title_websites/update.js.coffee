$(".dialog_box").modal('hide')
$("#title_website_<%= @title_website.id %>").children().last().append("<%= escape_javascript(render(:partial => '/admin/title_websites/td_list_title_website', :locals => { :title_website => @title_website})) %>")
