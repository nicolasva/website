$(".modal-title").html("Edit Submenu")
$(".modal-body").html("<%= escape_javascript(render(:partial => 'edit')) %>")
$(".dialog_box").modal("show")

$("#ColorFontSubmenu").ColorPicker({
  flat: true
  color: $('#ColorFontSubmenu').children().first().css("background-color")
  onShow: (colpkr) ->
    $(colpkr).fadeIn(500)
    return false
  onHide: (colpkr) ->
    $(colpkr).fadeOut(500)
    return false
  onChange: (hsb, hex, rgb) ->
    $('#ColorFontSubmenu div').css('backgroundColor', '#' +hex)
    $('#submenu_color_font').attr("value", '#' + hex)
})
