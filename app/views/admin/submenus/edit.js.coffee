$(".modal-title").html("Edit Submenu")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'edit')) %>")
$(".dialog_box").modal("show")
