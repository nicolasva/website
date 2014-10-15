$(".dialog_box").modal('hide')
$("#id_localisation_shop_<%= @localisation_shop.id %>").html("<%= escape_javascript(render(partial: '/admin/localisation_shops/list_td_location_shop', locals: { localisation_shop: @localisation_shop })) %>")
$("body").children().last().children().first().children().first().prepend("<%= escape_javascript(render(:partial => '/admin/footers/update')) %>")
