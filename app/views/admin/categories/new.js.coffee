$(".modal-title").html("Add new Category")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'new')) %>")
$(".dialog_box").modal("show")


$("#ColorFont").ColorPicker({
  flat: true
  color: $('#ColorFont').children().first().css("background-color")
  onShow: (colpkr) ->
    $(colpkr).fadeIn(500)
    return false
  onHide: (colpkr) ->
    $(colpkr).fadeOut(500)
    return false
  onChange: (hsb, hex, rgb) ->
    $('#ColorFont div').css('backgroundColor', '#' +hex)
    $('#category_color_font').attr("value", '#' + hex)
})
