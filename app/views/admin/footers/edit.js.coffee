$(".modal-title").html("Edit Legal Mentions")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'edit')) %>")
$(".dialog_box").modal("show")
