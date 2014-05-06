$(".modal-title").html("Contactez-nous")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'new')) %>")
$(".dialog_box").modal("show")
