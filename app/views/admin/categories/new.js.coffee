$(".modal-title").html("Add new Category")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'new')) %>")
$(".dialog_box").modal("show")
