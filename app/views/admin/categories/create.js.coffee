$(".dialog_box").modal('hide')
$(".category_list").append("<%= escape_javascript(render(:partial => '/admin/categories/list_category', :locals => { :category => @category })) %>")
