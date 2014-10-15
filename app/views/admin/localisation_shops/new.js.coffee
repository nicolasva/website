$(".modal-title").html("Add new localisation shop")
$(".modal-body").html("<%= escape_javascript(render(partial: 'new')) %>")
$(".dialog_box").modal("show")
