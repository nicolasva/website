$(".dialog_box").modal('hide')
$("#category_<%= @category.id %>").html("<%= escape_javascript(render(:partial => '/admin/categories/show', :locals => { :category => @category })) %>")
