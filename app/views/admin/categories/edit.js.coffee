$(".modal-title").html("Edit Category")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'edit')) %>")
$(".dialog_box").modal("show")
