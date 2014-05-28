$(".modal-title").html("Edit Robot Key")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'edit')) %>")
$(".dialog_box").modal("show")
