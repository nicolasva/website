$(".modal-title").html("Apperçu du message")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'show')) %>")
$(".dialog_box").modal("show")
