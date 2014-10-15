$(".modal-title").html("Edit localisation shop")
$(".modal-body").html("<%= escape_javascript(render(partial: 'edit')) %>")
$(".dialog_box").modal("show")
