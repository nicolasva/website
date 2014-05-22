$(".modal-title").html("Apperçu du message")
$(".modal-title").html("<%= escape_javascript(render(:partial => 'show')) %>")
$(".dialog_box").modal("show")
