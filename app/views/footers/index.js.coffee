$(".modal-title").html("Mentions légales")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'index')) %>")
$(".dialog_box").modal("show")

