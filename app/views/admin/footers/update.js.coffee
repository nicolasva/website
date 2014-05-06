$(".dialog_box").modal('hide')
$("body").children().last().children().first().children().first().prepend("<%= escape_javascript(render(:partial => 'update')) %>")

