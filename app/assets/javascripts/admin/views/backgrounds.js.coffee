jQuery ->
  $(document).on 'click', '.no_background_image', (e) ->
    if $(e.target).is(':checked') is true then $('.background_image').hide() else $('.background_image').show()

#jQuery -> 
#  $('#colorSelectorBackgroundColor').ColorPicker({
#    color: $('#colorSelectorBackgroundColor').children().first().css("background-color"),
#    onShow: (colpkr) ->
#      $(colpkr).fadeIn(500)
#      return false
#    onHide: (colpkr) ->
#      $(colpkr).fadeOut(500)
#      return false
#    onChange: (hsb, hex, rgb) ->
#      $('#colorSelectorBackgroundColor div').css('backgroundColor', '#' + hex)
#      $('#background_by_default_background_attributes_background_color').attr("value", '#' + hex)
#  })
