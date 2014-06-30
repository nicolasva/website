$(".modal-title").html("Add new Website title")
$(".modal-title").html("<%= escape_javascript(render(:partial => 'new')) %>")
$(".dialog_box").modal("show")
