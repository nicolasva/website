$(".dialog_box").modal('hide')
$("#localisationshops_list").children().last().append("<%= escape_javascript(render(partial: '/admin/localisation_shops/create', locals: { localisation_shop: @localisation_shop })) %>")
$("body").children().last().children().first().children().first().prepend("<%= escape_javascript(render(:partial => '/admin/footers/update')) %>")
