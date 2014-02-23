$(".modal-title").html("Add new Submenu")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'new')) %>")
$(".dialog_box").modal("show")

