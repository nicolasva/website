$(".modal-title").html("Edit Website title")
$(".modal-title").html("<%= escape_javascript(render(:partial => 'edit')) %>")
$(".dialog_box").modal("show")
