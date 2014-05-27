$(".modal-title").html("Add new Robot Key")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'new')) %>")
$(".dialog_box").modal("show")
