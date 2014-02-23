$(".dialog_box").modal('hide')
console.log $("#category_<%= @category.id %>").children()
$("#category_<%= @category.id %>").children().first().children().first().children().first().children().first().html(@category.title)
$($("#category_<%= @category.id %>").children().first().children().first().children().first().children()[1]).html(@category.english_title)
